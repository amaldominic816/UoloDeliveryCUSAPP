// import 'package:sixam_mart/controller/auth_controller.dart';
// import 'package:sixam_mart/controller/location_controller.dart';
// import 'package:sixam_mart/controller/user_controller.dart';
// import 'package:sixam_mart/data/model/response/userinfo_model.dart';
// import 'package:sixam_mart/util/dimensions.dart';
// import 'package:sixam_mart/util/images.dart';
// import 'package:sixam_mart/util/styles.dart';
// import 'package:sixam_mart/view/base/custom_app_bar.dart';
// import 'package:sixam_mart/view/base/custom_button.dart';
// import 'package:sixam_mart/view/base/custom_snackbar.dart';
// import 'package:sixam_mart/view/base/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sixam_mart/view/base/footer_view.dart';
// import 'package:sixam_mart/view/base/menu_drawer.dart';
// import 'dart:math';

// import '../../../helper/route_helper.dart';


// class NewPassScreen extends StatefulWidget {
//   final String? resetToken;
//   final String? number;
//   final bool fromPasswordChange;
//   const NewPassScreen({Key? key, required this.resetToken, required this.number, required this.fromPasswordChange}) : super(key: key);

//   @override
//   State<NewPassScreen> createState() => _NewPassScreenState();
// }

// class _NewPassScreenState extends State<NewPassScreen> {
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final FocusNode _newPasswordFocus = FocusNode();
//   final FocusNode _confirmPasswordFocus = FocusNode();

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ... (existing scaffold properties)
//       body: SafeArea(
//         child: Center(
//           child: Scrollbar(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: FooterView(
//                 child: Container(
//                   // ... (existing container properties)
//                   child: Column(
//                     children: [
//                       // ... (existing UI elements)

//                       GetBuilder<UserController>(
//                         builder: (userController) {
//                           return GetBuilder<AuthController>(
//                             builder: (authBuilder) {
//                               Future.delayed(Duration(seconds: 2), () {
//                                 // This code will be executed after 2 seconds
//                                 _resetPassword();
//                               });

//                               return CustomButton(
//                                 buttonText: 'Welcome To uolo delivery',
//                                 isLoading: authBuilder.isLoading ||
//                                     userController.isLoading,
//                                 onPressed: () => _resetPassword(),                              );
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _resetPassword() {
//     String newPassword = _generateRandomPassword(8);

//     if (widget.fromPasswordChange) {
//       _changePassword(newPassword);
//     } else {
//       _resetPasswordAndLogin(newPassword);
//     }
//   }

//   void _changePassword(String newPassword) {
//     UserInfoModel user = Get.find<UserController>().userInfoModel!;
//     user.password = newPassword;

//     Get.find<UserController>().changePassword(user).then((response) {
//       if (response.isSuccess) {
//         showCustomSnackBar('password_updated_successfully'.tr, isError: false);
//       } else {
//         // Handle the error case if needed
//       }
//     });
//   }

//   void _resetPasswordAndLogin(String newPassword) {
//     Get.find<AuthController>()
//         .resetPassword(widget.resetToken, '+${widget.number!.trim()}',
//         newPassword, newPassword)
//         .then((value) {
//       if (value.isSuccess) {
//         Get.find<AuthController>()
//             .login('+${widget.number!.trim()}', newPassword)
//             .then((value) async {
//           Get.offAllNamed(RouteHelper.getInitialRoute());

//         });
//       } else {
//         // showCustomSnackBar(value.message);
//       }
//     });
//   }

//   String _generateRandomPassword(int length) {
//     const String characters =
//         'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+-=[]{}|;:,.<>?';
//     final Random random = Random();

//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
//   }
// }


import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/controller/user_controller.dart';
import 'package:sixam_mart/data/model/response/userinfo_model.dart';
import 'package:sixam_mart/util/app_constants.dart';
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
import 'package:sixam_mart/view/base/no_internet_screen.dart';
import 'package:sixam_mart/view/screens/splash/splash_screen.dart';
import 'dart:math';

import '../../../helper/route_helper.dart';


// class NewPassScreen extends StatefulWidget {
//   final String? resetToken;
//   final String? number;
//   final bool fromPasswordChange;
//   const NewPassScreen({Key? key, required this.resetToken, required this.number, required this.fromPasswordChange}) : super(key: key);

//   @override
//   State<NewPassScreen> createState() => _NewPassScreenState();
// }

// class _NewPassScreenState extends State<NewPassScreen> {
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   final FocusNode _newPasswordFocus = FocusNode();
//   final FocusNode _confirmPasswordFocus = FocusNode();

//   oninit(){
//    _resetPassword();
//  }
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ... (existing scaffold properties)
//       body: SafeArea(
//         child: Center(
//           child: Scrollbar(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Visibility(
//                 visible: true,
//                 child: FooterView(
//                   child: Container(
//                     // ... (existing container properties)
//                     child: Column(
//                       children: [
//                         // ... (existing UI elements)
                
//                         GetBuilder<UserController>(
//                           builder: (userController) {
//                             return GetBuilder<AuthController>(
//                               builder: (authBuilder) {
//                                 // Future.delayed(Duration(seconds: 2), () {
//                                 //   // This code will be executed after 2 seconds
//                                 //   _resetPassword();
//                                 // });
                
//                                 return CustomButton(
//                                   buttonText: 'Welcome To uolo delivery',
//                                   isLoading: authBuilder.isLoading ||
//                                       userController.isLoading,
//                                   onPressed: () => _resetPassword(),                              );
//                               },
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _resetPassword() {
//     String newPassword = _generateRandomPassword(8);

//     if (widget.fromPasswordChange) {
//       _changePassword(newPassword);
//     } else {
//       _resetPasswordAndLogin(newPassword);
//     }
//   }

//   void _changePassword(String newPassword) {
//     UserInfoModel user = Get.find<UserController>().userInfoModel!;
//     user.password = newPassword;

//     Get.find<UserController>().changePassword(user).then((response) {
//       if (response.isSuccess) {
//         showCustomSnackBar('password_updated_successfully'.tr, isError: false);
//       } else {
//         // Handle the error case if needed
//         showCustomSnackBar(response.message);
//       }
//     });
//   }

//   void _resetPasswordAndLogin(String newPassword) {
//     Get.find<AuthController>()
//         .resetPassword(widget.resetToken, '+${widget.number!.trim()}',
//         newPassword, newPassword)
//         .then((value) {
//       if (value.isSuccess) {
//         Get.find<AuthController>()
//             .login('+${widget.number!.trim()}', newPassword)
//             .then((value) async {
//           Get.offAllNamed(RouteHelper.getInitialRoute());

//         });
//       } else {
//         // showCustomSnackBar(value.message);
//       }
//     });
//   }


  

//   String _generateRandomPassword(int length) {
//     const String characters =
//         'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+-=[]{}|;:,.<>?';
//     final Random random = Random();

//     return String.fromCharCodes(Iterable.generate(
//         length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
//   }
// }


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
  void initState() {
    super.initState();

       Future.delayed( const Duration(seconds: 1 ), () {
      _resetPassword(); 
    }
      
      )

   ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  Colors.white,
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            color: Colors.white,
          ),
          // Image.asset(
          //   'assets/image/background.png', // Replace with your background image path
          //   fit: BoxFit.cover,
          // ),
          // Content
          Center(
            child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BouncingLogo(),
                  
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  // Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: 25)),
                ],
              ) 
            
          ),
        ],
      ),
    );
    // 
    // 
    // Scaffold(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   body: SafeArea(
    //     child: Center(
    //       child: Scrollbar(
    //         child: SingleChildScrollView(
    //           physics: const BouncingScrollPhysics(),
    //           child: Visibility(
    //             visible: true,
    //             child: Container(
    //               child: Column(
    //                 children: [
    //                    Text('Uolo',  style: TextStyle(color: Colors.white, fontSize: 30),),
    //                 ]
    //               )
    //             )
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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
        showCustomSnackBar(response.message);
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


class BouncingLogo extends StatefulWidget {
  @override
  _BouncingLogoState createState() => _BouncingLogoState();
}

class _BouncingLogoState extends State<BouncingLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _animation.value),
      child: Image.asset(Images.logo, color: Theme.of(context).primaryColor, width: 200),
    );
  }
}
