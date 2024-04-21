import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/user_controller.dart';
import 'package:sixam_mart/data/model/response/userinfo_model.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/images.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/custom_app_bar.dart';
import 'package:sixam_mart/view/base/custom_button.dart';
import 'package:sixam_mart/view/base/custom_snackbar.dart';
import 'package:sixam_mart/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/view/base/footer_view.dart';
import 'package:sixam_mart/view/base/menu_drawer.dart';
import 'dart:math';

import '../../../helper/route_helper.dart';


class NewPassScreen extends StatefulWidget {
  final String? resetToken;
  final String? number;
  final bool fromPasswordChange;
  const NewPassScreen({Key? key, required this.resetToken, required this.number, required this.fromPasswordChange}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (existing scaffold properties)
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FooterView(
                child: Container(
                  // ... (existing container properties)
                  child: Column(
                    children: [
                      // ... (existing UI elements)

                      GetBuilder<UserController>(
                        builder: (userController) {
                          return GetBuilder<AuthController>(
                            builder: (authBuilder) {
                              Future.delayed(Duration(seconds: 2), () {
                                // This code will be executed after 2 seconds
                                _resetPassword();
                              });

                              return CustomButton(
                                buttonText: 'Welcome To uolo delivery',
                                isLoading: authBuilder.isLoading ||
                                    userController.isLoading,
                                onPressed: () => _resetPassword(),                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resetPassword() {
    String newPassword = _generateRandomPassword(8);

    if (widget.fromPasswordChange) {
      _changePassword(newPassword);
    } else {
      _resetPasswordAndLogin(newPassword);
    }
  }

  void _changePassword(String newPassword) {
    UserInfoModel user = Get.find<UserController>().userInfoModel!;
    user.password = newPassword;

    Get.find<UserController>().changePassword(user).then((response) {
      if (response.isSuccess) {
        showCustomSnackBar('password_updated_successfully'.tr, isError: false);
      } else {
        // Handle the error case if needed
      }
    });
  }

  void _resetPasswordAndLogin(String newPassword) {
    Get.find<AuthController>()
        .resetPassword(widget.resetToken, '+${widget.number!.trim()}',
        newPassword, newPassword)
        .then((value) {
      if (value.isSuccess) {
        Get.find<AuthController>()
            .login('+${widget.number!.trim()}', newPassword)
            .then((value) async {
          Get.offAllNamed(RouteHelper.getInitialRoute());

        });
      } else {
        // showCustomSnackBar(value.message);
      }
    });
  }

  String _generateRandomPassword(int length) {
    const String characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+-=[]{}|;:,.<>?';
    final Random random = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }
}