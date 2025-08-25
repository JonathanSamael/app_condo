import 'package:flutter/material.dart';

class OvalHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Canvas? canvas;
    Paint facePaint;
    if (size.height > 10) {
      //TODO - organizar essa condição para ver se tem ou não um rosto
      facePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0
        ..color = Colors.red;
    } else {
      facePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0
        ..color = Colors.green;
    }

    // canvas!.drawOval(
    Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.6,
      height: size.height * 0.4,
    );
    //   facePaint
    // );

    final ovalRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.6,
      height: size.height * 0.4,
    );

    path.addOval(ovalRect);
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
