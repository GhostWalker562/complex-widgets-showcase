import 'dart:math';
import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supercharged/supercharged.dart';

class LiquidWave extends StatelessWidget {
  // Optional
  final Duration duration;
  final double horizontalOffset;
  final double amplitude;
  final bool debug;
  final Color color;
  // Required
  final double sliderValue;

  /// Paints a [wave] using the parent's width and height.
  ///
  const LiquidWave(
    this.sliderValue, {
    Key key,
    this.duration,
    this.horizontalOffset,
    this.amplitude,
    this.color,
    this.debug = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      duration: duration ?? 2.5.seconds,
      // We tween to `2pi` to cover a whole period.
      tween: 0.0.tweenTo(2 * pi),
      builder: (context, widget, value) => CustomPaint(
        size: Size.infinite,
        painter: LiquidSliderPainter(
            sliderValue, value, amplitude + 0.0075.hp ?? 0.05.hp, color,
            debug: debug),
      ),
    );
  }
}

/// Painter designated for `LiquidWave`
///
class LiquidSliderPainter extends CustomPainter {
  // Optional
  final bool debug;
  final Color color;
  // Required
  final double sliderValue;
  final double tweenValue;
  final double amplitude;

  LiquidSliderPainter(
      this.sliderValue, this.tweenValue, this.amplitude, this.color,
      {this.debug = false});

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    Paint paint = Paint()
      ..color = (color ?? PALETTE[3]).withOpacity(0.15);
    Paint debugPaint = Paint()..color = Colors.red;
    Path path = Path();

    /// We use a [sin graph] in order to create the wave effect.
    /// We also multiply it by an optional amplitude in order to
    /// make it adjustable.
    double yFactor = amplitude * sin(tweenValue);

    /// Progression by taking the `value/endValue` and multiplying it by the width of the parent
    /// in order to sweep over the container horizontally.
    double xFactor = ((tweenValue) / (2 * pi)) * x;

    /// In order to make the slider be used from bottom to top;
    double sliderVerticalPosition = -sliderValue + y;

    // Draw
    path.moveTo(0, sliderVerticalPosition);
    path.quadraticBezierTo(
        xFactor, sliderVerticalPosition + yFactor, x, sliderVerticalPosition);

    // Reset
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.close();

    // Paint
    canvas.drawPath(path, paint);

    /// [DEBUG]
    ///
    if (debug) {
      canvas.drawCircle(
          Offset(xFactor, sliderVerticalPosition + yFactor), 2.5, debugPaint);
    }
  }

  @override
  bool shouldRepaint(LiquidSliderPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LiquidSliderPainter oldDelegate) => false;
}
