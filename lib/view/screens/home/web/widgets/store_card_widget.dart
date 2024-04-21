import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/localization_controller.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/controller/wishlist_controller.dart';
import 'package:sixam_mart/data/model/response/module_model.dart';
import 'package:sixam_mart/data/model/response/store_model.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/custom_image.dart';
import 'package:sixam_mart/view/base/custom_snackbar.dart';
import 'package:sixam_mart/view/base/discount_tag.dart';
import 'package:sixam_mart/view/base/hover/on_hover.dart';
import 'package:sixam_mart/view/base/not_available_widget.dart';
import 'package:sixam_mart/view/base/rating_bar.dart';
import 'package:sixam_mart/view/screens/store/store_screen.dart';

class StoreCardWidget extends StatelessWidget {
  final Store? store;

  const StoreCardWidget({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? discount = store!.discount?.discount ?? 0;
    String? discountType = store!.discount?.discountType ?? 'percent';
    bool isAvailable = store!.open == 1 && store!.active!;

    return OnHover(
      isItem: true,
      child: InkWell(
        onTap: () {
          if (store != null) {
            if (Get.find<SplashController>().moduleList != null) {
              for (ModuleModel module in Get.find<SplashController>().moduleList!) {
                if (module.id == store!.moduleId) {
                  Get.find<SplashController>().setModule(module);
                  break;
                }
              }
            }
            Get.toNamed(
              RouteHelper.getStoreRoute(id: store!.id, page: 'item'),
              arguments: StoreScreen(store: store, fromModule: false),
            );
          }
        },
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            border: Border.all(color: Theme.of(context).disabledColor.withOpacity(0.1)),
            boxShadow: ResponsiveHelper.isDesktop(context) ? [] : [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusDefault)),
                    child: CustomImage(
                      image: '${Get.find<SplashController>().configModel!.baseUrls!.storeImageUrl}/${store!.logo}',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Positioned(
                    top: 70,
                    left: 0,
                    child: SizedBox(
                      width: 100, // Adjust the width as needed
                      height: 100, // Adjust the height as needed
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          DiscountTag(

                            discount: discount,
                            discountType: discountType,
                          ),
                          if (!isAvailable)
                            Positioned(
                              top: -10,
                              left: 18,
                              child: NotAvailableWidget(
                                isStore: true,
                                fontSize: Dimensions.fontSizeSmall,
                                isAllSideRound: false,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 350,
                    child: GetBuilder<WishListController>(
                      builder: (wishController) {
                        bool isWished = wishController.wishStoreIdList.contains(store!.id);
                        return InkWell(
                          onTap: () {
                            if (Get.find<AuthController>().isLoggedIn()) {
                              isWished
                                  ? wishController.removeFromWishList(store!.id, true)
                                  : wishController.addToWishList(null, store!, true);
                            } else {
                              showCustomSnackBar('you_are_not_logged_in'.tr);
                            }
                          },
                          child: Icon(
                            isWished ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: isWished ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall,horizontal: Dimensions.paddingSizeSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.width * 0.7 - 116,
                        child: Text(
                          store!.name ?? '',
                          style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 15, color: Theme.of(context).primaryColor),
                          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                          Flexible(
                            child: Text(
                              store!.address ?? '',
                              style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 15, color: Theme.of(context).primaryColor),
                          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                          Text(
                            '${store!.deliveryTime}',
                            style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}