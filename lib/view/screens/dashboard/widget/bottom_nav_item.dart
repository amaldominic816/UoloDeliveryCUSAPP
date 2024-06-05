import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/controller/theme_controller.dart';
import 'package:sixam_mart/util/dimensions.dart';
import 'package:sixam_mart/util/styles.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem({Key? key, required this.iconData, this.onTap, this.isSelected = false, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              iconData,
              color: isSelected ? Color(0xff26063b) : const Color(0xff484545),
              size: 25, // Adjust the size here
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Text(
                  title,
                  style: robotoRegular.copyWith(
                      color: 
                      isSelected ? const Color(0xff000000) :
                      //  Theme.of(context).disabledColor.withOpacity(0.8)
                      // Theme.of(context).primaryColor
                      const Color(0xff484545)
                       ,
                      fontSize: 12),
                )
                    // : Text(title)
              ],
            ),
          ],
        ),
      ),
    );
  }
}