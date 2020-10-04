import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BlurredCircleWidget extends StatelessWidget {
  // Optional
  final double blurWidth;
  final double blurStrength;

  /// Paints a [BlurredCircle] using the parent's width and height.
  ///
  const BlurredCircleWidget({Key key, this.blurWidth, this.blurStrength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: BlurredCircledPainter(
            blurWidth: blurWidth ?? 0.05.hp, blurStrength: blurStrength ?? 25),
      ),
    );
  }
}

class BlurredCircledPainter extends CustomPainter {
  BlurredCircledPainter({@required this.blurWidth, this.blurStrength});

  /// Controls the distances of the blur. This may go past
  /// beyond the border of its parent.
  /// 
  final double blurWidth;

  /// Controls the blur strength. The blur used is a gaussian blur.
  ///
  final double blurStrength;

  @override
  void paint(Canvas canvas, Size size) {
    
    /// We will draw a circle with a specific stroke aimed towards
    /// create a blurred effect.
    ///
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(Offset(0, 0), Offset(size.width, 0), [
        Color(0xff14ffe9).withOpacity(1 - blurStrength * 3 / 100),
        Color(0xffffeb3b).withOpacity(1 - blurStrength * 3 / 100),
        Color(0xfff00e0).withOpacity(1 - blurStrength * 3 / 100)
      ], [
        0.0,
        0.5,
        1
      ])
      ..style = PaintingStyle.stroke
      ..strokeWidth = blurWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurStrength);
    
    /// We take the smallest radius from the width and height. 
    /// This is for responsive purposes.
    /// 
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(BlurredCircledPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BlurredCircledPainter oldDelegate) => false;
}
