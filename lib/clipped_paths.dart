import 'package:flutter/material.dart';
import 'package:jewelstoreapp/colors.dart';

class TopClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path pathTop = Path();
    //
    pathTop.lineTo(0, size.height * 0.22);
    pathTop.quadraticBezierTo(size.width * 0.05, size.height * 0.16,
        size.width * 0.16, size.height * 0.13);
    pathTop.quadraticBezierTo(size.width * 0.43, size.height * 0.06,
        size.width * 0.8, size.height * 0.124);
    pathTop.quadraticBezierTo(
        size.width * 1, size.height * 0.16, size.width, size.height * 0.21);
    pathTop.lineTo(size.width, 0);
    pathTop.close();
    //
    return pathTop;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// bottom clipped part
class BottomClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path pathBottom = Path();
    //
    pathBottom.moveTo(size.width, size.height * 0.44);
    pathBottom.quadraticBezierTo(size.width * 0.98, size.height * 0.48,
        size.width * 0.93, size.height * 0.5);
    pathBottom.quadraticBezierTo(
        size.width * 0.26, size.height * 0.76, 0, size.height * 0.5);
    pathBottom.lineTo(0, size.height);
    pathBottom.lineTo(size.width, size.height);
    pathBottom.close();
    //

    return pathBottom;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
