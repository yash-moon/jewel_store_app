import 'package:flutter/material.dart';
import 'package:jewelstoreapp/colors.dart';

class PaintedBlob extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white.withOpacity(0.1);
//    paint.color = Colors.redAccent;
    paint.style = PaintingStyle.fill;
    var pathBlob = Path();
    //
    pathBlob.moveTo(0, size.height * 0.5);
    pathBlob.lineTo(0, size.height * 0.22);
    //
    pathBlob.quadraticBezierTo(size.width * 0.05, size.height * 0.16,
        size.width * 0.16, size.height * 0.13);
    pathBlob.quadraticBezierTo(size.width * 0.43, size.height * 0.06,
        size.width * 0.8, size.height * 0.124);
    pathBlob.quadraticBezierTo(
        size.width * 1, size.height * 0.16, size.width, size.height * 0.21);
    pathBlob.lineTo(size.width, size.height * 0.44);
    //
    pathBlob.quadraticBezierTo(size.width * 0.98, size.height * 0.48,
        size.width * 0.93, size.height * 0.5);
    pathBlob.quadraticBezierTo(
        size.width * 0.26, size.height * 0.76, 0, size.height * 0.5);
    //
    canvas.drawPath(pathBlob, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// top painted shadow part
class PaintedTopShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var pathTop = Path();
    var paint = Paint();
    paint.color = Colors.transparent;
    paint.style = PaintingStyle.fill;
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
    canvas.drawPath(pathTop, paint);
    canvas.drawShadow(pathTop, blueShadow, 25, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// Bottom painted shadow part
class PaintedBottomShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var pathBottom = Path();
    var paint = Paint();
    paint.color = Colors.transparent;
    paint.style = PaintingStyle.fill;
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
    canvas.drawPath(pathBottom, paint);
    canvas.drawShadow(pathBottom, Colors.white, 160, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
