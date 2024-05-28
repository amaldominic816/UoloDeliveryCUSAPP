import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:sixam_mart/controller/auth_controller.dart';
import 'package:sixam_mart/controller/banner_controller.dart';
import 'package:sixam_mart/controller/location_controller.dart';
import 'package:sixam_mart/controller/splash_controller.dart';
import 'package:sixam_mart/data/model/response/address_model.dart';
import 'package:sixam_mart/helper/responsive_helper.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';
import 'package:sixam_mart/view/base/custom_image.dart';
import 'package:sixam_mart/view/base/custom_loader.dart';
import 'package:sixam_mart/view/base/title_widget.dart';
import 'package:sixam_mart/view/screens/address/widget/address_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/view/screens/home/widget/banner_view.dart';
import 'package:sixam_mart/view/screens/home/widget/popular_store_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sixam_mart/view/screens/home/widget/utils.dart';

import '../../../../controller/user_controller.dart';
import '../../../../helper/route_helper.dart';

class ModuleView extends StatefulWidget {
  final SplashController splashController;
  final String? suffix;
  const ModuleView({Key? key, required this.splashController ,this.suffix}) : super(key: key);


  @override
  State<ModuleView> createState() => _ModuleViewState();
}

class _ModuleViewState extends State<ModuleView>  {
  List<String> buttonTexts = ['Gifts...', 'Documents', 'Electronics','Package'];
  int currentTextIndex = 0;


  List<String> flashSaleTexts = [
    'Restaurants:',
    'Groceries Galore:',
    'HomeBakers:',
    'Medicine:',
    'Style Meets Convenience: ',
    'Tech Marvels Delivered:',


  ];

  List<String> feastDescriptionTexts = [
    'Order Delectable Delights with Just a Tap!',
    'Shop Smart, Live Fresh with Our Seamless Delivery!',
    'Irresistible Bakery Delights Delivered to You!',
    'Medicine Delivery  When You Need It Most!',
    ' Style Yourself Delivered with a Click!',
    'Elevate Your Lifestyle with Electronics ',
  ];

  List<String> orderButtonTexts = ['Order Now', 'Shop Now', 'Order Now', 'Get It Now', 'Shop Now','Shop Now'];
  List<String> imagePaths = [
    'assets/image/food.png',
    'assets/image/grocery.png',
    'assets/image/poster504x498f8f8f8-pad600x600f8f8f8-1.png',
    'assets/image/medicine.png',
    'assets/image/e649b1fb89294922b1da7b0669d58abd-1.png',
    'assets/image/electronics.png',
    // Add more image paths as needed
  ];

  int currentFlashSaleIndex = 0;
  int currentimageIndex =0;
  @override
  void initState() {
    super.initState();


    // Start a periodic timer to change the button text every 2 seconds
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      setState(() {
        currentTextIndex = (currentTextIndex + 1) % buttonTexts.length;
        currentFlashSaleIndex =(currentFlashSaleIndex + 1) % flashSaleTexts.length;
        currentimageIndex=(currentimageIndex + 1) % imagePaths.length;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;




// Change this if needed







    return SafeArea(
      
      
      child: Center(
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          
          
          
          
          // Wrap the item builder with a Container
            Container(
              width: double.infinity,
              child: Container(
                // androidscreenCWD (1:32)
                width: double.infinity,
                height: 890*fem,
                decoration: BoxDecoration (
                  color: Color(0xfff3f3f3),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // autogroupszkmu9j (LRnRda7tv3g2mRjYZnsZkM)
                      left: 0*fem,
                      top: 0*fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(18*fem, 10*fem, 18*fem, 17*fem),
                        width: 360*fem,
                        height: 220*fem,
                        decoration: const BoxDecoration (
                          color:  Color(0xFFC2C5F2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
          
                         Container(
                              // autogroup84qxaFs (LRnS7e9TYh15iZHzgA84qX)
                              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 19*fem, 35*fem),
                              width: double.infinity,
                              height: 40*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogroupwxr7gJu (LRnSJ41n23uQtATH5AwxR7)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 0*fem),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                         onTap: () => Get.find<LocationController>().navigateToLocationScreen('home'),
                                         
                                          child: Text(
                                            // deliverytoSBb (1:34)
                                            'Delivery to',
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff23241f),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => Get.find<LocationController>().navigateToLocationScreen('home'),
                                          child: GetBuilder<LocationController>(
                                            builder: (locationController) {
                                              String userAddress = locationController.getUserAddress()?.address ?? '';
                                                  
                                              if (userAddress.length > 35) {
                                                return InkWell(
                                                  onTap: () => Get.find<LocationController>().navigateToLocationScreen('home'),
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () => Get.find<LocationController>().navigateToLocationScreen('home'),
                                                          child: Text(
                                                            userAddress.substring(0, 35),
                                                            style: SafeGoogleFont(
                                                              'Poppins',
                                                              fontSize: 12 * ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1 * ffem / fem,
                                                              color: Color(0xff23241f),
                                                            ),
                                                          ),
                                                        ),
                                                    
                                                        InkWell(
                                                          onTap: () => Get.find<LocationController>().navigateToLocationScreen('home'),
                                                          child: Text(
                                                            userAddress.substring(35),
                                                            style: SafeGoogleFont(
                                                              'Poppins',
                                                              fontSize: 12 * ffem,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1.5 * ffem / fem,
                                                              color: Color(0xff23241f),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Text(
                                                  userAddress,
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5 * ffem / fem,
                                                    color: Color(0xff23241f),
                                                  ),
                                                );
                                              }
                                                  
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
          
                                   Center(
                                   
                                    
                                     child: Container(
                                       // 6G9 (14567349)
                                       
                                       margin: EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 13 * fem),
                                       width: 50 * fem,
                                       height: 60 * fem,
                                       child: Container(
                                         // autogroupkgc1dWy (LRnSQt9jHgMPY1y2mnkgc1)
                                         padding: EdgeInsets.fromLTRB(1 * fem, 4 * fem, 4 * fem, 1 * fem),
                                         width: 50 * fem,
                                         height: 60 * fem,
                                         constraints: const BoxConstraints(
                                           minWidth: double.infinity,
                                           minHeight: double.infinity,
                                         ),
                                         decoration: BoxDecoration(
                                           color: Color(0xffffffff),
                                           borderRadius: BorderRadius.circular(5 * fem),
                                         ),
                                         child: GridView.count(
                                           crossAxisCount: 2,
                                           childAspectRatio: 2,
                                           children: [
                                             GestureDetector(
                                               onTap: () {
                                                 Get.toNamed(RouteHelper.getWalletRoute(false));
                                               },
                                               child: Container(
                                                 width: 50 * fem,
                                                 height: 20 * fem,
                                                 child: Image.asset(
                                                   'assets/image/vector.png',
                                                   width: 50 * fem,
                                                   height: 20 * fem,
                                                 ),
                                               ),
                                             ),
                                             GetBuilder<UserController>(builder: (userController) {
                                               final bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
                                                                    
                                               return Container(
                                                 // autogroupr2a58s3 (LRnSWo9YSG2rfL5hKRR2A5)
                                                 width: 40 * fem,
                                                 height: 40 * fem,
                                                 child: Center(
                                                   child: Text(
                                                     '${isLoggedIn ? userController.userInfoModel?.loyaltyPoint ?? 0 : ''} ${''.tr}',
                                                     style: SafeGoogleFont(
                                                       'Poppins',
                                                       fontSize: 10 * ffem,
                                                       fontWeight: FontWeight.w700,
                                                       color: Color(0xFF1B032B),
                                                     ),
                                                   ),
                                                 ),
                                               );
                                             }),
                                           ],
                                         ),
                                       ),
                                     ),
                                   )
          
          
                                ],
                              ),
                            ),
                             Container(
                              // autogroup23ayDNh (LRnSoHg4d7r295FJ7A23ay)
                              width: double.infinity,
                              height: 116*fem,
                              child: Stack(
                                children: [
          
                                  Positioned(
                                    left: 0 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 171 * fem,
                                        height: 27 * fem,
                                        child: Text(
                                          flashSaleTexts[currentFlashSaleIndex],
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 18 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff23241f),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 1 * fem,
                                    top: 27 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 187 * fem,
                                        height: 36 * fem,
                                        child: Text(
                                          feastDescriptionTexts[currentFlashSaleIndex],
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff23241f),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 1 * fem,
                                    top: 74 * fem,
                                    child: Container(
                                      width: 127 * fem,
                                      height: 42 * fem,
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(13 * fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          orderButtonTexts[currentFlashSaleIndex],
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xff121212),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ... (your existing code)
          
                                  // Positioned(
                                  //   left: 185 * fem,
                                  //   top: 0 * fem,
                                  //   child: Align(
                                  //     child: SizedBox(
                                  //       width: 139 * fem,
                                  //       height: 108 * fem,
                                  //       child: CarouselSlider(
                                  //         items: [
                                  //           // ... (your existing code)
                                  //         ],
                                  //         options: CarouselOptions(
                                  //           height: 108 * fem,
                                  //           enlargeCenterPage: true,
                                  //           autoPlay: true,
                                  //           aspectRatio: 16 / 9,
                                  //           onPageChanged: (index, reason) {
                                  //             setState(() {
                                  //               currentFlashSaleIndex = index % flashSaleTexts.length;
                                  //             });
                                  //           },
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
          
                                  Positioned(
                                    left: 185 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 139 * fem,
                                        height: 108 * fem,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: imagePaths.length, // Replace with the actual list of image paths
                                          itemBuilder: (context, index) {
                                            return Image.asset(
                                              imagePaths[currentimageIndex],
                                              width: 139 * fem,
                                              height: 108 * fem,
                                              fit: BoxFit.fitHeight,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupbqyzp9X (LRnXj4dZFYfAqZWCX1bQYZ)
                      left: 0*fem,
                      top: 261*fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(18*fem, 0*fem, 0*fem, 74*fem),
                        width: 360*fem,
                        height: 1007*fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group38t9P (1:42)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 16*fem),
                              height: 103*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // autogroupelkjc5P (LRnYAiZUet9RaiegrbeLKj)
                                    width: 91*fem,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
          
                                          // autogroupzroswtM (LRnYHiMpVRpmRQ46QJZros)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
          
                                          width: double.infinity,
                                          height: 70*fem,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(9*fem),
                                          ),
          
                                          child: Stack(
                                            children: [
                                              Positioned(
          
          
                                                // productspreview12uo (1:50)
                                                left: 5*fem,
                                                top: 8*fem,
          
                                                child: Align(
          
          
                                                  child: SizedBox(
                                                    width: 78*fem,
                                                    height: 53*fem,
          
                                                    child: GestureDetector(
                                                      onTap: () => widget.splashController.switchModule(0, true),
          
          
                                                      child: Image.asset(
          
                                                      'assets/image/food.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Positioned(
                                              //   // frame9vVP (1:124)
                                              //   left: 9*fem,
                                              //   top: 53*fem,
                                              //   child: Container(
                                              //     width: 71*fem,
                                              //     height: 12*fem,
                                              //     decoration: BoxDecoration (
                                              //       color: Color(0xfff0dcf5),
                                              //       borderRadius: BorderRadius.circular(32*fem),
                                              //     ),
                                              //     child: Center(
                                              //       child: Text(
                                              //         'Upto 50% off',
                                              //         style: SafeGoogleFont (
                                              //           'Poppins',
                                              //           fontSize: 8*ffem,
                                              //           fontWeight: FontWeight.w500,
                                              //           height: 1.5*ffem/fem,
                                              //           color: Color(0xff23241f),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              ), ],
                                          ),
                                        ),
                                        Container(
                                          // groceryZoF (1:46)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                                          child: GestureDetector(
          onTap: () => widget.splashController.switchModule(0, true),
          
                                            child: Text(
                                              // widget.splashController.moduleList?.isNotEmpty == true
                                              //     ? widget.splashController.moduleList![0].moduleName!
                                                   'Food ', // Change 'Default Text' to the text you want to display
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                color: Color(0xff121212),
                                              ),
                                            ),
                                          ),
          
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24*fem,
                                  ),
                                  Container(
                                    // autogroupjynhdo7 (LRnYRsntJQ7fZrh4sdJyNh)
                                    width: 91*fem,
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // autogrouppkszkcq (LRnYWxUkcPeJm3MUBpPKSZ)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                          padding: EdgeInsets.fromLTRB(22*fem, 8*fem, 12*fem, 13*fem),
                                          width: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(9*fem),
                                          ),
                                          child: Center(
                                            // poster504x498f8f8f8pad600x600f (1:49)
                                            child: SizedBox(
                                              width: 78*fem,
                                              height: 53*fem,
                                              child: GestureDetector(
                                                onTap: () => widget.splashController.switchModule(1, true),
                                              child: Image.asset(
                                                'assets/image/grocery.png'
                                               ,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ),
                                        Container(
                                          // homebakersiCH (1:51)
                                          margin: EdgeInsets.fromLTRB(7*fem, 0*fem, 1*fem, 0*fem),
                                          constraints: BoxConstraints (
                                            maxWidth: 50*fem,
                                          ),
                                          child: Text(
                                            'Grocery',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.25*ffem/fem,
                                              color: Color(0xff121212),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24*fem,
                                  ),
                                  Container(
                                    // autogroupvfr1BLm (LRnYcneNUWi6HwXJouVFr1)
                                    width: 91*fem,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // autogroupeomj817 (LRnYi7ppdt5nGN2BtjEoMj)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                          width: double.infinity,
                                          height: 70*fem,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(9*fem),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // cuteburgerimagecheeseburgerapp (1:48)
                                                left: 4*fem,
                                                top: 5*fem,
                                                right:4*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 70*fem,
                                                    height: 70*fem,
                                                    child: GestureDetector(
                                                      onTap: () => widget.splashController.switchModule(7, true),
                                                    child: Image.asset(
                                                      'assets/image/dailyfresh.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Positioned(
                                              //   // frame10hiR (1:126)
                                              //   left: 24*fem,
                                              //   top: 53*fem,
                                              //   child: Container(
                                              //     width: 44*fem,
                                              //     height: 12*fem,
                                              //     decoration: BoxDecoration (
                                              //       color: Color(0xffffd7c3),
                                              //       borderRadius: BorderRadius.circular(32*fem),
                                              //     ),
                                              //     child: Center(
                                              //       child: Text(
                                              //         '20 min',
                                              //         style: SafeGoogleFont (
                                              //           'Poppins',
                                              //           fontSize: 8*ffem,
                                              //           fontWeight: FontWeight.w500,
                                              //           height: 1.5*ffem/fem,
                                              //           color: Color(0xff23241f),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // foodaGR (1:47)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                          child: Text(
                                            'Daily Fresh',
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff121212),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogroupabqbHRj (LRnTDXUgCesfoDKjkVaBqb)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 5*fem),
                              height: 65*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // autogroup7berDKP (LRnTXMJJvrXkmZcZJw7beR)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                    padding: EdgeInsets.fromLTRB(13*fem, 2*fem, 13*fem, 0*fem),
                                    decoration: BoxDecoration (
                                      color: Color(0xffeaeaea),
                                      borderRadius: BorderRadius.circular(6*fem),
                                    ),
                                    child: Align(
                                      // c8111d660f17cc4a85816cebeb0020 (1:90)
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 46*fem,
                                        height: 62*fem,
                                        // child: GestureDetector(
                                        //   onTap: () => widget.splashController.switchModule(1, true),
          
                                        child: GestureDetector(
          onTap: () => widget.splashController.switchModule(2, true),
          
                                          child: Image.asset(
                                            'assets/image/cake.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // autogroupikxk1m3 (LRnTbmLcyB8wDSiMEmikXK)
                                    width: 72*fem,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle19Ma1 (1:68)
                                          left: 0*fem,
                                          top: 1*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 72*fem,
                                              height: 64*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                  color: Color(0xffeaeaea),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // e649b1fb89294922b1da7b0669d58a (1:91)
                                          left: 1*fem,
                                          top: 0*fem,
                                          child: Align(
          
                                            child: SizedBox(
                                              width: 67*fem,
                                              height: 65*fem,
                                              // child: GestureDetector(
                                              //
                                              child: InkWell(
                                                onTap: () => widget.splashController.switchModule(3, true),
                                              child: Image.asset(
          
                                                'assets/image/medicine.png',
                                              ),
          
                                            ),
                                          ),
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // autogroupxnd7m7w (LRnTsqiAjjsgj89pQnXnD7)
                                    padding: EdgeInsets.fromLTRB(11*fem, 1*fem, 0*fem, 0*fem),
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          // autogroupzvzhJNm (LRnTgWhi9LCr2ybSrnZVzh)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                          padding: EdgeInsets.fromLTRB(2*fem, 4*fem, 2*fem, 0*fem),
                                          width: 72*fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(6*fem),
                                          ),
                                          child: Align(
                                            // ccc2ba33827fcef01896d430cee138 (1:92)
                                            alignment: Alignment.bottomLeft,
                                            child: SizedBox(
                                              width: 61*fem,
                                              height: 60*fem,
                                              // child: GestureDetector(
                                              //   onTap: () => widget.splashController.switchModule(2, true),
          
          
                                              child: GestureDetector(
                                                onTap: () => widget.splashController.switchModule(6, true),
                                                child: Image.asset(
                                                  'assets/image/electronics.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // autogroupw4h77b7 (LRnTkbRF3pMJ7Cuw6Sw4H7)
                                          width: 72*fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(6*fem),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // bdeb534ef0b6922e311a1a9aa9bf06 (1:93)
                                                left: 10*fem,
                                                top: 34*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 20*fem,
                                                    height: 20*fem,
                                                    child: Image.asset(
                                                      'assets/image/bdeb534ef0b6922e311a1a9aa9bf06d-1.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
          
                                                 Positioned(
                                                  // c5c127412713ea68d6ea1b1605ab9c (1:94)
                                                  left: 6*fem,
                                                  top: 2*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 54*fem,
                                                      height: 61*fem,
                                                      child: Image.asset(
                                                        'assets/image/c5c127412713ea68d6ea1b1605ab9c-1.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
          ],
                                        ),
          
          
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogroupg2t937P (LRnU7feTqv11Df4yf7G2t9)
                              margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 37*fem, 10*fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // healthm3P (1:52)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23*fem, 0*fem),
                                    child: Text(
                                      'Home\nBakers',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // fashiongAM (1:53)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 0*fem),
                                    child: Text(
                                      'Medicine',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // mobilesBso (1:64)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                                    child: Text(
                                      'Electronics',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 11*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // moreshopsu37 (1:65)
                                    constraints: BoxConstraints (
                                      maxWidth: 38*fem,
                                    ),
                                    child: Text(
                                      'More\nShops',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => widget.splashController.switchModule(4, true),
          
                              child: Container(
                                // autogroupbsnyQEm (LRnUP5NTLopHz2wqSmbsNy)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 20*fem),
                                padding: EdgeInsets.fromLTRB(16*fem, 8*fem, 16*fem, 14*fem),
                                width: 324*fem,
                                height: 100*fem,
                                decoration: BoxDecoration (
                                  border: Border.all(color: Color(0xFFEAEAEA)),
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(9*fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x0f000000),
                                      offset: Offset(-3*fem, 3*fem),
                                      blurRadius: 4*fem,
                                    ),
          
                                  ],
          
                                ),
                                child: Container(
                                  // group41FWH (1:119)
                                  width: 269*fem,
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // preview1PsP (1:120)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                        width: 110*fem,
                                        height: 100*fem,
                                        child: Image.asset(
                                          'assets/image/parcel.png',
                                          width: 100*fem, // set the desired width (or adjust as needed)
                                          height: 100 *fem, // set the desired height (or adjust as needed)
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        // group40u53 (1:121)
                                        margin: EdgeInsets.fromLTRB(0*fem, 14*fem, 0*fem, 5*fem),
                                        width: 166*fem,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                        Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'We Deliver Everything',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 12 * fem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.0714285714 * ffem / fem,
                                                color: const Color(0xff1b032b),
                                              ),
                                            ),
                                            SizedBox(height: 12 * fem), // You can adjust this value for spacing between the two texts
                                            Text(
                                              'Send ${buttonTexts[currentTextIndex]}',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * fem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.0714285714 * ffem / fem,
                                                color: const Color(0xff1b032b),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
          
          
          
                                          // Container(
                                          //   width: double.infinity,
                                          //   height: 25*fem,
                                          //   alignment: Alignment.center,
                                          //   child: ElevatedButton(
                                          //     onPressed: () => widget.splashController.switchModule(4, true),
                                          //
                                          //
                                          //   child: Text('Book Now'),
                                          //
                                          // ),
                                          // ),
          
          
                                            // Container(
                                            //   // addyourcodeandsaveonyourorder6 (1:123)
                                            //   constraints: BoxConstraints (
                                            //     maxWidth: 166*fem,
                                            //   ),
                                            //   child: Text(
                                            //     'Quick,Easy,Reliable.\n Send packages effortlessly ',
                                            //     style: SafeGoogleFont (
                                            //       'Poppins',
                                            //       fontSize: 8*ffem,
                                            //       fontWeight: FontWeight.w300,
                                            //       height: 1.5*ffem/fem,
                                            //       color: Color(0xff585858),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
          
                            Container(
                              // serviceszVo (1:71)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 130*fem, 4*fem),
                              child: Text(
                                textAlign: TextAlign.start,
                                'Services(Coming Soon..)',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 0.9375*ffem/fem,
                                  color: Color(0xff121212),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupxhn1WU9 (LRnUfKQPgHnQgYGxTsXhN1)
                              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 9*fem),
                              height: 66*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // autogroupyjmoS6u (LRnUyosagAMxQC8PQfYJMo)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                                    width: 62*fem,
                                    height: 60*fem,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle21Yfj (1:73)
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 61*fem,
                                              height: 60*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                  color: Color(0xffeaeaea),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // carhbk1Fq3 (1:128)
                                          left: 0*fem,
                                          top: 22*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 62*fem,
                                              height: 35*fem,
                                              child: Image.asset(
                                                'assets/image/carhbk-1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // autogroupwsyoNPs (LRnV4e4s8n3Yp8xJxDwSyo)
                                    width: 61*fem,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          // rectangle22vAV (1:74)
                                          left: 0*fem,
                                          top: 6*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 61*fem,
                                              height: 60*fem,
                                              child: Container(
                                                decoration: BoxDecoration (
                                                  borderRadius: BorderRadius.circular(6*fem),
                                                  color: Color(0xffeaeaea),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // f2160267796zsgminbydwtijzea6cp (1:89)
                                          left: 5*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 50*fem,
                                              height: 65*fem,
                                              child: Image.asset(
                                                'assets/image/f2160267796zsgminbydwtijzea6cpekacytgkioif-1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // autogroupfgc97Vs (LRnVN8Zij9EuQqTppVFGC9)
                                    padding: EdgeInsets.fromLTRB(10*fem, 6*fem, 0*fem, 0*fem),
                                    height: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          // autogrouproztF6H (LRnV8tSncBRN5CAT2yRoZT)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                          padding: EdgeInsets.fromLTRB(3*fem, 5*fem, 6*fem, 1*fem),
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(6*fem),
                                          ),
                                          child: Align(
                                            // depositphotos14703893stockphot (1:95)
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              width: 52*fem,
                                              height: 54*fem,
                                              child: Image.asset(
                                                'assets/image/depositphotos14703893-stock-photo-electrician-on-white-background-1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // autogroup1n6m43j (LRnVCZ1M6NVQBMkoev1N6m)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                          padding: EdgeInsets.fromLTRB(3*fem, 4*fem, 5*fem, 1*fem),
                                          height: double.infinity,
                                          decoration: BoxDecoration (
                                            color: Color(0xffeaeaea),
                                            borderRadius: BorderRadius.circular(6*fem),
                                          ),
                                          child: Align(
                                            // f171096062igjcwyvopktiax9o2vcu (1:96)
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(
                                              width: 53*fem,
                                              height: 55*fem,
                                              child: Image.asset(
                                                'assets/image/f171096062igjcwyvopktiax9o2vculxcz2bpguykt-1.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // autogroupu8lqHx5 (LRnVG3uX1eL56hTWRmU8Lq)
                                          width: 63*fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // rectangle25Sa5 (1:77)
                                                left: 6*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 57*fem,
                                                    height: 60*fem,
                                                    child: Container(
                                                      decoration: BoxDecoration (
                                                        color: Color(0xffeaeaea),
                                                        borderRadius: BorderRadius.only (
                                                          topLeft: Radius.circular(6*fem),
                                                          bottomLeft: Radius.circular(6*fem),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // e173e39d66a8ce9cce50281050e94f (1:97)
                                                left: 0*fem,
                                                top: 5*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 63*fem,
                                                    height: 55*fem,
                                                    child: Image.asset(
                                                      'assets/image/e173e39d66a8ce9cce50281050e94f-1.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // autogroupxe2veAM (LRnVkTFrn87rRUoGEJxE2V)
                              margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 0*fem, 0*fem),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // taxiAeV (1:54)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                    child: Text(
                                      'Taxi',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // plumbert4h (1:57)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                                    child: Text(
                                      'Plumber',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // electrician19K (1:59)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0*fem),
                                    child: Text(
                                      'Electrician',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // laboripR (1:61)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                                    child: Text(
                                      'Labor',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // painterdwP (1:63)
                                    margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                    child: Text(
                                      'Painter',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.25*ffem/fem,
                                        color: Color(0xff121212),
                                      ),
                                    ),
                                  ),
          
                                ],
                              ),
                            ),
          
                            GetBuilder<BannerController>(builder: (bannerController) {
                              return const BannerView(isFeatured: true);
                            }),
          
          
                            // Container(
                            //   // popularrestaurantsnearbyomK (1:72)
                            //   margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 116*fem, 8*fem),
                            //   child: Text(
                            //     'Popular Restaurants nearby',
                            //     textAlign: TextAlign.center,
                            //     style: SafeGoogleFont (
                            //       'Poppins',
                            //       fontSize: 16*ffem,
                            //       fontWeight: FontWeight.w500,
                            //       height: 0.9375*ffem/fem,
                            //       color: Color(0xff121212),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   // autogroupvdqkWfj (LRnW4H5VWKmwPq65nkVdqK)
                            //   margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                            //   width: double.infinity,
                            //   height: 0*fem,
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.end,
                            //     children: [
                            //       Container(
                            //         // autogroup1tjzeG9 (LRnWMMRNgPtt2TsU3J1TJZ)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 0*fem),
                            //         width: 0*fem,
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           children: [
                            //             // Container(
                            //             //   // autogrouplzjvNC9 (LRnWTWumgMRPw1pcMZLzJV)
                            //             //   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            //             //   padding: EdgeInsets.fromLTRB(6*fem, 4*fem, 7*fem, 4*fem),
                            //             //   width: double.infinity,
                            //             //   height: 76*fem,
                            //             //   decoration: BoxDecoration (
                            //             //     border: Border.all(color: Color(0xffffeee6)),
                            //             //     color: Color(0xffffeee6),
                            //             //     borderRadius: BorderRadius.circular(6*fem),
                            //             //   ),
                            //             //   child: Align(
                            //             //     // vintageretrologodesignbeerrest (1:86)
                            //             //     alignment: Alignment.topCenter,
                            //             //     child: SizedBox(
                            //             //       width: 71*fem,
                            //             //       height: 59*fem,
                            //             //       child: Image.asset(
                            //             //         'assets/image/vintage-retro-logo-design-beer-restaurant-bar-evening-party-vector-illustration-with-hand-ho680164-74-1.png',
                            //             //         fit: BoxFit.cover,
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Container(
                            //             //   // homebakersLYH (1:55)
                            //             //   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                            //             //   constraints: BoxConstraints (
                            //             //     maxWidth: 42*fem,
                            //             //   ),
                            //             //   child: Text(
                            //             //     'Home\nbakers',
                            //             //     textAlign: TextAlign.center,
                            //             //     style: SafeGoogleFont (
                            //             //       'Poppins',
                            //             //       fontSize: 12*ffem,
                            //             //       fontWeight: FontWeight.w500,
                            //             //       height: 1.25*ffem/fem,
                            //             //       color: Color(0xff121212),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //           ],
                            //         ),
                            //       ),
                            //       Container(
                            //         // autogrouppuwfexH (LRnWabYJoMiRN7AqpopuwF)
                            //         width: 251*fem,
                            //         height: double.infinity,
                            //         child: Stack(
                            //           children: [
                            //             // Positioned(
                            //             //   // homebakersNtH (1:58)
                            //             //   left: 19*fem,
                            //             //   top: 88*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 42*fem,
                            //             //       height: 30*fem,
                            //             //       child: Text(
                            //             //         'Home\nbakers',
                            //             //         textAlign: TextAlign.center,
                            //             //         style: SafeGoogleFont (
                            //             //           'Poppins',
                            //             //           fontSize: 12*ffem,
                            //             //           fontWeight: FontWeight.w500,
                            //             //           height: 1.25*ffem/fem,
                            //             //           color: Color(0xff121212),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // homebakersTuj (1:60)
                            //             //   left: 107*fem,
                            //             //   top: 85*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 42*fem,
                            //             //       height: 30*fem,
                            //             //       child: Text(
                            //             //         'Home\nbakers',
                            //             //         textAlign: TextAlign.center,
                            //             //         style: SafeGoogleFont (
                            //             //           'Poppins',
                            //             //           fontSize: 12*ffem,
                            //             //           fontWeight: FontWeight.w500,
                            //             //           height: 1.25*ffem/fem,
                            //             //           color: Color(0xff121212),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // homebakersAp9 (1:62)
                            //             //   left: 190*fem,
                            //             //   top: 88*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 42*fem,
                            //             //       height: 30*fem,
                            //             //       child: Text(
                            //             //         'Home\nbakers',
                            //             //         textAlign: TextAlign.center,
                            //             //         style: SafeGoogleFont (
                            //             //           'Poppins',
                            //             //           fontSize: 12*ffem,
                            //             //           fontWeight: FontWeight.w500,
                            //             //           height: 1.25*ffem/fem,
                            //             //           color: Color(0xff121212),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // rectangle304ed (1:84)
                            //             //   left: 0*fem,
                            //             //   top: 9*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 84*fem,
                            //             //       height: 76*fem,
                            //             //       child: Container(
                            //             //         decoration: BoxDecoration (
                            //             //           borderRadius: BorderRadius.circular(6*fem),
                            //             //           border: Border.all(color: Color(0xffe6e6e6)),
                            //             //           color: Color(0xffffeee6),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // rectangle31NQR (1:85)
                            //             //   left: 90*fem,
                            //             //   top: 9*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 84*fem,
                            //             //       height: 76*fem,
                            //             //       child: Container(
                            //             //         decoration: BoxDecoration (
                            //             //           borderRadius: BorderRadius.circular(6*fem),
                            //             //           border: Border.all(color: Color(0xffe6e6e6)),
                            //             //           color: Color(0xffffeee6),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // designrestaurantminimalistlogo (1:87)
                            //             //   left: 15*fem,
                            //             //   top: 9*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 54*fem,
                            //             //       height: 64*fem,
                            //             //       child: Image.asset(
                            //             //         'assets/image/design-restaurant-minimalist-logo-creation-2-9dddf6e9-1.png',
                            //             //         fit: BoxFit.cover,
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // cebbe91aimage1kfs (1:88)
                            //             //   left: 82*fem,
                            //             //   top: 0*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 98*fem,
                            //             //       height: 76*fem,
                            //             //       child: Image.asset(
                            //             //         'assets/image/cebbe91aimage-1.png',
                            //             //         fit: BoxFit.cover,
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // rectangle32GPK (1:102)
                            //             //   left: 180*fem,
                            //             //   top: 9*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 71*fem,
                            //             //       height: 76*fem,
                            //             //       child: Container(
                            //             //         decoration: BoxDecoration (
                            //             //           border: Border.all(color: Color(0xffffeee6)),
                            //             //           color: Color(0xffffeee6),
                            //             //           borderRadius: BorderRadius.only (
                            //             //             topLeft: Radius.circular(6*fem),
                            //             //             bottomLeft: Radius.circular(6*fem),
                            //             //           ),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //             // Positioned(
                            //             //   // attachment1053237512xX3 (1:103)
                            //             //   left: 172*fem,
                            //             //   top: 25*fem,
                            //             //   child: Align(
                            //             //     child: SizedBox(
                            //             //       width: 77*fem,
                            //             //       height: 73*fem,
                            //             //       child: Image.asset(
                            //             //         'assets/image/attachment105323751-2.png',
                            //             //       ),
                            //             //     ),
                            //             //   ),
                            //             // ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
          
                            // Container(
                            //   // autogroupp4bsGnd (LRnWzqLvNtk52FFHU9P4Bs)
                            //   margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 21*fem, 0*fem),
                            //   width: double.infinity,
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         // autogroupfi1xPMT (LRnXEk7QmXV57C7Ge1fi1X)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 1*fem),
                            //         width: 8*fem,
                            //         height: 8*fem,
                            //         child: Image.asset(
                            //           'assets/image/auto-group-fi1x.png',
                            //           width: 8*fem,
                            //           height: 8*fem,
                            //         ),
                            //       ),
                            //       Container(
                            //         // minHSq (1:56)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                            //         child: Text(
                            //           '36 min',
                            //           textAlign: TextAlign.center,
                            //           style: SafeGoogleFont (
                            //             'Poppins',
                            //             fontSize: 8*ffem,
                            //             fontWeight: FontWeight.w500,
                            //             height: 1.875*ffem/fem,
                            //             color: Color(0xffa4a4a4),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         // autogroupa4bbnPb (LRnXJzVLEvrtNFKQimA4bB)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 1*fem),
                            //         width: 8*fem,
                            //         height: 8*fem,
                            //         child: Image.asset(
                            //           'assets/image/auto-group-a4bb.png',
                            //           width: 8*fem,
                            //           height: 8*fem,
                            //         ),
                            //       ),
                            //       Container(
                            //         // mingUy (1:110)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49*fem, 0*fem),
                            //         child: Text(
                            //           '36 min',
                            //           textAlign: TextAlign.center,
                            //           style: SafeGoogleFont (
                            //             'Poppins',
                            //             fontSize: 8*ffem,
                            //             fontWeight: FontWeight.w500,
                            //             height: 1.875*ffem/fem,
                            //             color: Color(0xffa4a4a4),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         // autogrouprrrjQA5 (LRnXNpiHJ3AHfEoRBnrRRj)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 1*fem),
                            //         width: 8*fem,
                            //         height: 8*fem,
                            //         child: Image.asset(
                            //           'assets/image/auto-group-rrrj.png',
                            //           width: 8*fem,
                            //           height: 8*fem,
                            //         ),
                            //       ),
                            //       Container(
                            //         // minVSR (1:111)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 41*fem, 0*fem),
                            //         child: Text(
                            //           '36 min',
                            //           textAlign: TextAlign.center,
                            //           style: SafeGoogleFont (
                            //             'Poppins',
                            //             fontSize: 8*ffem,
                            //             fontWeight: FontWeight.w500,
                            //             height: 1.875*ffem/fem,
                            //             color: Color(0xffa4a4a4),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         // autogroupkbfozPB (LRnXSKcTDJzxaaW7xeKBfo)
                            //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 1*fem),
                            //         width: 8*fem,
                            //         height: 8*fem,
                            //         child: Image.asset(
                            //           'assets/image/auto-group-kbfo.png',
                            //           width: 8*fem,
                            //           height: 8*fem,
                            //         ),
                            //       ),
                            //       Text(
                            //         // mintjT (1:112)
                            //         '36 min',
                            //         textAlign: TextAlign.center,
                            //         style: SafeGoogleFont (
                            //           'Poppins',
                            //           fontSize: 8*ffem,
                            //           fontWeight: FontWeight.w500,
                            //           height: 1.875*ffem/fem,
                            //           color: Color(0xffa4a4a4),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Positioned(
                    //   // group44EYR (1:129)
                    //   left: 0*fem,
                    //   top: 727*fem,
                    //   child: Align(
                    //     child: SizedBox(
                    //       width: 360*fem,
                    //       height: 78*fem,
                    //       child: Image.asset(
                    //         'assets/image/group-44.png',
                    //         width: 360*fem,
                    //         height: 78*fem,
                    //       ),
                    //     ),
                    //   ),
                    // ),
          
          
                  ],
                ),
              ),
            ),
          
          
          
          
          
            // widget.splashController.moduleList != null ? widget.splashController.moduleList!.isNotEmpty ? GridView.builder(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3, mainAxisSpacing: Dimensions.paddingSizeSmall,
            //     crossAxisSpacing: Dimensions.paddingSizeSmall, childAspectRatio: (1/1),
            //   ),
            //   padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            //   itemCount: widget.splashController.moduleList!.length,
            //   shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return InkWell(
            //       onTap: () => widget.splashController.switchModule(index, true),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            //           color: Theme.of(context).cardColor,
            //           border: Border.all(color: Theme.of(context).primaryColor, width: 0.15),
            //           boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.1), spreadRadius: 1, blurRadius: 3)],
            //         ),
            //         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            //             child: CustomImage(
            //               image: '${widget.splashController.configModel!.baseUrls!.moduleImageUrl}/${widget.splashController.moduleList![index].icon}',
            //               height: 50, width: 50,
            //             ),
            //           ),
            //           const SizedBox(height: Dimensions.paddingSizeSmall),
            //
            //           Center(child: Text(
            //             widget.splashController.moduleList![index].moduleName!,
            //             textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
            //             style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
            //           )),
            //
            //         ]),
            //       ),
            //     );
            //   },
            // ) : Center(child: Padding(
            //   padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall), child: Text('no_module_found'.tr),
            // )) : ModuleShimmer(isEnabled: widget.splashController.moduleList == null),
            //
            // GetBuilder<LocationController>(builder: (locationController) {
            //   List<AddressModel?> addressList = [];
            //   if(Get.find<AuthController>().isLoggedIn() && locationController.addressList != null) {
            //     addressList = [];
            //     bool contain = false;
            //     if(locationController.getUserAddress()!.id != null) {
            //       for(int index=0; index<locationController.addressList!.length; index++) {
            //         if(locationController.addressList![index].id == locationController.getUserAddress()!.id) {
            //           contain = true;
            //           break;
            //         }
            //       }
            //     }
            //     if(!contain) {
            //       addressList.add(Get.find<LocationController>().getUserAddress());
            //     }
            //     addressList.addAll(locationController.addressList!);
            //   }
            //   return (!Get.find<AuthController>().isLoggedIn() || locationController.addressList != null) ? addressList.isNotEmpty ? Column(
            //     children: [
            //
            //       const SizedBox(height: Dimensions.paddingSizeLarge),
            //
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            //         child: TitleWidget(title: 'deliver_to'.tr),
            //       ),
            //       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
            //
            //       SizedBox(
            //         height: 75,
            //         child: ListView.builder(
            //           physics: const BouncingScrollPhysics(),
            //           itemCount: addressList.length,
            //           scrollDirection: Axis.horizontal,
            //           padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            //           itemBuilder: (context, index) {
            //             return Container(
            //               width: 300,
            //               padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
            //               child: AddressWidget(
            //                 address: addressList[index],
            //                 fromAddress: false,
            //                 onTap: () {
            //                   if(locationController.getUserAddress()!.id != addressList[index]!.id) {
            //                     Get.dialog(const CustomLoader(), barrierDismissible: false);
            //                     locationController.saveAddressAndNavigate(
            //                       addressList[index], false, null, false, ResponsiveHelper.isDesktop(context),
            //                     );
            //                   }
            //                 },
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ],
            //   ) : const SizedBox() : AddressShimmer(isEnabled: Get.find<AuthController>().isLoggedIn() && locationController.addressList == null);
            // }),
          
            const PopularStoreView(isPopular: false, isFeatured: true),
          
            const SizedBox(height: 120),
          
          
          ]),
        ),
      ),
    );

  }
}

class ModuleShimmer extends StatelessWidget {
  final bool isEnabled;
  const ModuleShimmer({Key? key, required this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, mainAxisSpacing: Dimensions.paddingSizeSmall,
        crossAxisSpacing: Dimensions.paddingSizeSmall, childAspectRatio: (1/1),
      ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      itemCount: 6,
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 200]!, spreadRadius: 1, blurRadius: 5)],
          ),
          child: Shimmer(
            duration: const Duration(seconds: 2),
            enabled: isEnabled,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

              Container(
                height: 50, width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSmall), color: Colors.grey[300]),
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Center(child: Container(height: 15, width: 50, color: Colors.grey[300])),

            ]),
          ),
        );
      },
    );

  }
}

class AddressShimmer extends StatelessWidget {
  final bool isEnabled;
  const AddressShimmer({Key? key, required this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimensions.paddingSizeLarge),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: TitleWidget(title: 'deliver_to'.tr),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),

        SizedBox(
          height: 70,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                child: Container(
                  padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeDefault
                      : Dimensions.paddingSizeSmall),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                    boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, blurRadius: 5, spreadRadius: 1)],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.location_on,
                      size: ResponsiveHelper.isDesktop(context) ? 50 : 40, color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    Expanded(
                      child: Shimmer(
                        duration: const Duration(seconds: 2),
                        enabled: isEnabled,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(height: 15, width: 100, color: Colors.grey[300]),
                          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                          Container(height: 10, width: 150, color: Colors.grey[300]),
                        ]),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
        ),

      ],

    );

  }
}


