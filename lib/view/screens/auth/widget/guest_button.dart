import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/util/styles.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return !authController.guestLoading
          ? TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(1, 40),
              ),
              onPressed: () {
                authController.guestLogin().then((response) {
                  if (response.isSuccess) {
                    Navigator.pushReplacementNamed(
                        context, RouteHelper.getInitialRoute());
                  }
                });
              },
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Continue as a',
                    style: robotoRegular.copyWith(
                        color: Theme.of(context).disabledColor)),
                TextSpan(
                    text: ' Guest User',
                    style: robotoMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color)),
              ])),
            )
          : const Center(
              child: SizedBox(
                  height: 25, width: 25, child: CircularProgressIndicator()));
    });
  }
}
