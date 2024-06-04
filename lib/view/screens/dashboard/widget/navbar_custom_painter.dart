import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // paint.color = const Color(0xffe7e3e3);
   paint.color = const Color(0xFFFFFFFF);

    // Define the new height from the top
    double newHeightFromTop = size.height / 3;

    // Draw a rectangle with the new height from the top
    path.moveTo(0, size.height);
    path.lineTo(0, newHeightFromTop);
    path.lineTo(size.width, newHeightFromTop);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}




// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Theme.of(Get.context!).primaryColor
//       ..style = PaintingStyle.fill;
//
//     Path path = Path();
//     path.moveTo(0, 20); // Start
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20), radius: const Radius.circular(20.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 20);
//     canvas.drawShadow(path, Colors.black, 5, true);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
