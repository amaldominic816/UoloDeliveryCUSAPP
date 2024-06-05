import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/localization_controller.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/controller/store_controller.dart';
import 'package:sixam_mart/controller/wishlist_controller.dart';
import 'package:sixam_mart/data/model/response/item_model.dart';
import 'package:sixam_mart/data/model/response/store_model.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/app_constants.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/add_favourite_view.dart';
import 'package:sixam_mart/view/base/custom_button.dart';
import 'package:sixam_mart/view/base/custom_image.dart';
import 'package:sixam_mart/view/base/custom_snackbar.dart';
import 'package:sixam_mart/view/base/discount_tag.dart';
import 'package:sixam_mart/view/base/not_available_widget.dart';
import 'package:sixam_mart/view/base/rating_bar.dart';
import 'package:sixam_mart/view/screens/store/store_screen.dart';

// class VisitAgainCard extends StatelessWidget {
//   final Store store;
//   final bool fromFood;
//   const VisitAgainCard({Key? key, required this.store, required this.fromFood}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isPharmacy = Get.find<SplashController>().module != null && Get.find<SplashController>().module!.moduleType.toString() == AppConstants.pharmacy;
//     bool isFood = Get.find<SplashController>().module != null && Get.find<SplashController>().module!.moduleType.toString() == AppConstants.food;

//     return InkWell(
//       hoverColor: Colors.transparent,
//       onTap: () {
//         Get.toNamed(
//           RouteHelper.getStoreRoute(id: store.id, page: 'store'),
//           arguments: StoreScreen(store: store, fromModule: false),
//         );
//       },
//       child: Stack(children: [
//         Container(
//           margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//             color: Theme.of(context).cardColor,
//             border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2), width: 1),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]
//           ),
//           child:  Padding(
//             padding: const EdgeInsets.only(top: 40, bottom: Dimensions.paddingSizeSmall),
//             child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

//               Flexible(child: Text(store.name ?? '', style: robotoBold, maxLines: 1, overflow: TextOverflow.ellipsis)),

//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Icon(Icons.star, size: 15, color: Theme.of(context).primaryColor),
//                 const SizedBox(width: Dimensions.paddingSizeExtraSmall),

//                 Text(store.avgRating!.toStringAsFixed(1), style: robotoRegular),
//                 const SizedBox(width: Dimensions.paddingSizeExtraSmall),

//                 Text("(${store.ratingCount})", style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor)),
//               ]),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//                 child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Icon(Icons.storefront_outlined, size: 20, color: Theme.of(context).disabledColor),
//                   const SizedBox(width: Dimensions.paddingSizeExtraSmall),

//                   Flexible(
//                     child: Text(
//                       store.address ?? '',
//                       overflow: TextOverflow.ellipsis, maxLines: 1,
//                       style: robotoRegular.copyWith(color: Theme.of(context).disabledColor),
//                     ),
//                   ),
//                 ]),
//               ),

//               Container(
//                 alignment: Alignment.center,
//                 height: 25, width: 150,
//                 child: ListView.builder(
//                   itemCount: store.items!.length,
//                   scrollDirection: Axis.horizontal,
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
//                       child: Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular((isPharmacy || isFood) ? 100 : Dimensions.radiusSmall),
//                             child: CustomImage(
//                               image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                                 '/${store.items![index].image}',
//                                 fit: BoxFit.cover, height: 25, width: 25,
//                             ),
//                           ),

//                           // index == store.items!.length -1 ? Positioned(
//                           //   top: 0, left: 0,right: 0, bottom: 0,
//                           //   child: Container(
//                           //     decoration: BoxDecoration(
//                           //       borderRadius: BorderRadius.circular((isPharmacy || isFood) ? 100 : Dimensions.radiusSmall),
//                           //       color: Colors.black.withOpacity(0.5),
//                           //     ),
//                           //     child: Center(child: Text(
                                 
//                           //         (store.itemCount! < 10) ? '20+' :
//                           //       // (store.itemCount! > 20) ? '20+' :
//                           //       //  '${10}', 
//                           //       "${store.items!.length}",
//                           //       // store.itemCount!.toString(),
                                
//                           //         style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall),
//                           //     )),
//                           //   ),
//                           // ) : const SizedBox(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ]),
//           ),
//         ),

//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             height: 54, width: 54,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(fromFood ? 100 : Dimensions.radiusDefault),
//               color: Theme.of(context).cardColor,
//               border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2), width: 2),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(fromFood ? 100 : Dimensions.radiusDefault),
//               child: CustomImage(
//                 image: '${Get.find<SplashController>().configModel!.baseUrls!.storeCoverPhotoUrl}'
//                     '/${store.coverPhoto}',
//                 fit: BoxFit.cover, height: 54, width: 54,
//               ),
//             ),
//           ),
//         ),

//         AddFavouriteView(
//           top: 30, right: 10,
//           item: Item(id: store.id),
//         ),
//       ]),
//     );
//   }

  
// }




// void printvalue ( value){
 
//  print( value);
// } 


// foodcount ( itemcount){
 
//  if (itemcount < 10) {

//   printvalue( '20+');
//  }

// }







// visit again card 2

// class VisitAgainCard extends StatelessWidget {
//   final Store store;
//   final bool fromFood;
//   const VisitAgainCard({Key? key, required this.store, required this.fromFood}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isPharmacy = Get.find<SplashController>().module!= null && Get.find<SplashController>().module!.moduleType.toString() == AppConstants.pharmacy;
//     bool isFood = Get.find<SplashController>().module!= null && Get.find<SplashController>().module!.moduleType.toString() == AppConstants.food;

//     return InkWell(
//       hoverColor: Colors.transparent,
//       onTap: () {
//         Get.toNamed(
//           RouteHelper.getStoreRoute(id: store.id, page: 'tore'),
//           arguments: StoreScreen(store: store, fromModule: false),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//           color: Theme.of(context).cardColor,
//           border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2), width: 1),
//           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 100,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusDefault), topRight: Radius.circular(Dimensions.radiusDefault)),
//                     image: DecorationImage(
//                       image: NetworkImage('${Get.find<SplashController>().configModel!.baseUrls!.storeCoverPhotoUrl}/${store.coverPhoto}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: AddFavouriteView(
//                     item: Item(id: store.id),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     store.name?? '',
//                     style: robotoBold,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.star, size: 15, color: Theme.of(context).primaryColor),
//                           const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                           Text(
//                             store.avgRating!.toStringAsFixed(1),
//                             style: robotoRegular,
//                           ),
//                           const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                           Text(
//                             "(${store.ratingCount})",
//                             style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         store.address?? '',
//                         style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: Dimensions.paddingSizeSmall),
//                   Container(
//                     height: 25,
//                     child: ListView.builder(
//                       itemCount: store.items!.length,
//                       scrollDirection: Axis.horizontal,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
//                           child: Stack(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular((isPharmacy || isFood)? 100 : Dimensions.radiusSmall),
//                                 child: CustomImage(
//                                   image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}/${store.items![index].image}',
//                                   fit: BoxFit.cover,
//                                   height: 25,
//                                   width: 25,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







// visitagain card 4




class VisitAgainCard extends StatelessWidget {
  final Store store;
  final bool fromFood;
  const VisitAgainCard({Key? key, required this.store, required this.fromFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPharmacy = Get.find<SplashController>().module != null && Get.find<SplashController>().module!.moduleType.toString() == AppConstants.pharmacy;
    double distance = Get.find<LocationController>().getRestaurantDistance(
      LatLng(double.parse(store.latitude!), double.parse(store.longitude!)),
    );

    return InkWell(
    
      child: Stack(children: [
        InkWell(
            hoverColor: Colors.transparent,
      onTap: () {
        Get.toNamed(
          RouteHelper.getStoreRoute(id: store.id, page: 'tore'),
          arguments: StoreScreen(store: store, fromModule: false),
        );
      },
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            decoration: BoxDecoration(
              color:  
              Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              boxShadow: ResponsiveHelper.isMobile(context) ? [BoxShadow(color: Colors.black.withOpacity(0.05), spreadRadius: 0, blurRadius: 10, offset: const Offset(0, 1))] : null,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  child: CustomImage(
                    image: '${Get.find<SplashController>().configModel!.baseUrls!.storeImageUrl}/${store.logo}',
                    height: 50, width: 50, fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                      width: 190,
                      child: Text(store.name ?? '', style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    !isPharmacy ? RatingBar(
                      rating: store.avgRating,
                      ratingCount: store.ratingCount,
                      size: 12,
                    ) : Row(children: [
                      Icon(Icons.storefront, size: 15, color: Theme.of(context).primaryColor),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Expanded(
                        child: Text(store.address ?? '',
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).primaryColor),
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    !isPharmacy ? Row(children: [
                      Icon(Icons.storefront, size: 15, color: Theme.of(context).primaryColor),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Flexible(
                        child: Text(store.address ?? '',
                          style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).primaryColor),
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                       ),
                      ),
                    ]) : Text('${store.items?.length}' ' ' 'items'.tr, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor)),
                  ]),
                ),
              ]),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Row(children:[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: 3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
                  ),
                  child: Row(children: [
                    Image.asset(Images.distanceLine, height: 15, width: 15),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    Text('${distance > 100? '100+' : distance.toStringAsFixed(2)} ${'km'.tr}', style: robotoBold.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall)),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    Text('from_you'.tr, style: robotoRegular.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeSmall)),
                  ]),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: 3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
                  ),
                  child: Row(children: [
                    Image.asset(Images.clockIcon, height: 15, width: 15, color: Get.find<StoreController>().isOpenNow(store)? const Color(0xffECA507) : Theme.of(context).colorScheme.error),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    Text(Get.find<StoreController>().isOpenNow(store)? 'open_now'.tr : 'closed_now'.tr, style: robotoBold.copyWith(color: Get.find<StoreController>().isOpenNow(store)? const Color(0xffECA507) : Theme.of(context).colorScheme.error, fontSize: Dimensions.fontSizeSmall)),
                  ]),
                ),
              ]),
            ]),
          ),
        ),

        //  Container(
        //         alignment: Alignment.topRight,
        //         height: 25, width: 150,
        //         child: ListView.builder(
        //           itemCount: store.items!.length,
        //           scrollDirection: Axis.horizontal,
        //           physics: const NeverScrollableScrollPhysics(),
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
        //               child: Stack(
        //                 children: [
        //                   ClipRRect(
        //                     borderRadius: BorderRadius.circular((isPharmacy || fromFood) ? 100 : Dimensions.radiusSmall),
        //                     child: CustomImage(
        //                       image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
        //                         '/${store.items![index].image}',
        //                         fit: BoxFit.cover, height: 25, width: 25,
        //                     ),
        //                   ),

        //                   // index == store.items!.length -1 ? Positioned(
        //                   //   top: 0, left: 0,right: 0, bottom: 0,
        //                   //   child: Container(
        //                   //     decoration: BoxDecoration(
        //                   //       borderRadius: BorderRadius.circular((isPharmacy || isFood) ? 100 : Dimensions.radiusSmall),
        //                   //       color: Colors.black.withOpacity(0.5),
        //                   //     ),
        //                   //     child: Center(child: Text(
                                 
        //                   //         (store.itemCount! < 10) ? '20+' :
        //                   //       // (store.itemCount! > 20) ? '20+' :
        //                   //       //  '${10}', 
        //                   //       "${store.items!.length}",
        //                   //       // store.itemCount!.toString(),
                                
        //                   //         style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall),
        //                   //     )),
        //                   //   ),
        //                   // ) : const SizedBox(),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //       ),

// Align(
//   alignment: Alignment.topRight,
//   child: Container(
//     alignment: Alignment.bottomLeft,
//     height: 25, width: 150,
//     child: ListView.builder(
//       itemCount: store.items!.length,
//       scrollDirection: Axis.horizontal,
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
//           child: Stack(
//             children: [
//               // Background image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular((isPharmacy || fromFood) ? 100 : Dimensions.radiusSmall),
//                 child: CustomImage(
//                   image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                     '/${store.items![index].image}',
//                   fit: BoxFit.cover, height: 25, width: 25,
//                 ),
//               ),
//               // Foreground image (smaller and positioned on top)
//               Positioned(
//                 left: 5, // adjust the left position to create a small gap
//                 top: 0,
//                 bottom: 0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular((isPharmacy || fromFood) ? 100 : Dimensions.radiusSmall),
//                   child: CustomImage(
//                     image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                       '/${store.items![index].image}',
//                     fit: BoxFit.cover, height: 20, width: 20, // adjust the size to be smaller
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   ),
// )

// Align(
//   alignment: Alignment.topRight,
//   child: Container(
//     height: 55, width: 150,
//     child: Stack(
//       children: [
//         for (int i = 0; i < (store.items!.length > 4? 4 : store.items!.length); i++)
//           Positioned(
//             left: i * 20, // adjust the left position to create a small gap
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular((isPharmacy || fromFood)? 100 : Dimensions.radiusSmall),
//                 child: CustomImage(
//                   image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                     '/${store.items![i].image}',
//                   fit: BoxFit.cover, height: 40, width: 40, // adjust the size to be smaller
//                 ),
//               ),
//             ),
//           ),
//       ],
//     ),
//   ),
// )
//         // Positioned(
//         //   top: 0,
//         //   left: Get.find<LocalizationController>().isLtr? null : 0,
//         //   right: Get.find<LocalizationController>().isLtr? 0 : null,
//         //   child: GetBuilder<WishListController>(builder: (wishController) {
//         //     bool isWished = wishController.wishStoreIdList.contains(store.id);
//         //     return InkWell(
//         //       onTap: () {
//         //         if(Get.find<AuthController>().isLoggedIn()) {
//         //           isWished? wishController.removeFromWishList(store.id, true)
//         //               : wishController.addToWishList(null, store, true);
//         //         }else {
//         //           showCustomSnackBar('you_are_not_logged_in'.tr);
//         //         }
//         //       },
//         //       child: Icon(
//         //         isWished? Icons.favorite : Icons.favorite_border,  size: 20,
//         //         color: Theme.of(context).primaryColor,
//         //       ),
//         //     );
//         //   }),
//         // ),

// ,
//         store.items!.length > 0 &&  store.items!.length < store.items!.length -1 ?   
//                            Positioned(
//                             top: 0, left: 0,right: 0, bottom: 0,
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular((isPharmacy || fromFood) ? 100 : Dimensions.radiusSmall),
//                                   color: Colors.black.withOpacity(0.5),
//                                 ),
//                                 child: Center(child: Text(
                                   
//                                     (store.itemCount! < 20) ? '20+' :
//                                   // (store.itemCount! > 20) ? '20+' :
//                                   //  '${10}', 
//                                   "${store.items!.length}",
//                                   // store.itemCount!.toString(),
                                  
//                                     style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall),
//                                 )),
//                               ),
//                             ),
//                           ) : const SizedBox(),

// Align(
//   alignment: Alignment.topRight,
//   child: Container(
//     height: 55, width: 150,
//     child: Stack(
//       children: [
//         for (int i = 0; i < (store.items!.length > 4? 4 : store.items!.length); i++)
//           Positioned(
//             left: i * 20, // adjust the left position to create a small gap
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular((isPharmacy || fromFood)? 100 : Dimensions.radiusSmall),
//                 child: CustomImage(
//                   image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                     '/${store.items![i].image}',
//                   fit: BoxFit.cover, height: 40, width: 40, // adjust the size to be smaller
//                 ),
//               ),
//             ),
//           ),
//         store.items!.length > 4
//            ? Positioned(
//                 bottom: 0,
//                 left: (store.items!.length) * 20,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular((isPharmacy || fromFood)? 100 : Dimensions.radiusSmall),
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '+${store.items!.length }',
//                       style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall),
//                     ),
// ),
//                 ),
//               )
//            : const SizedBox(),
//       ],
//     ),
//   ),
// )

 fromFood ?   
Align(
  alignment: Alignment.topRight,
  child: Container(
    height: 55, width: 150,
    child: Stack(
      children: [
        for (int i = 0; i < 4; i++)
          Positioned(
            left: i * 20, // adjust the left position to create a small gap
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular((isPharmacy || fromFood)? 100 : Dimensions.radiusSmall),
                child: CustomImage(
                  image: '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
                    '/${store.items![i].image}',
                  fit: BoxFit.cover, height: 40, width: 40, // adjust the size to be smaller
                ),
              ),
            ),
          ),
        // store.items!.length 
          // ?
          //  Positioned(
          //   top: 10,
          //     // bottom: 20,
          //     left: 70, // center the text on the last image
          //     child: Container(
          //       height: 40, width: 40,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular((isPharmacy || fromFood)? 100 : Dimensions.radiusSmall),
          //         color: Colors.black.withOpacity(0.5),
          //       ),
          //       child: Center(
          //         child: Text(
          //           '+${store.items!.length }', // show the remaining length
          //           style: robotoMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),
          //         ),
          //       ),
          //     ),
          //   )
          // : const SizedBox(),
      ],
    ),
  ),
):  AddFavouriteView(
          top: 15, right: 30,
          item: Item(id: store.id),
        ),

      ]),
    );
  }
}