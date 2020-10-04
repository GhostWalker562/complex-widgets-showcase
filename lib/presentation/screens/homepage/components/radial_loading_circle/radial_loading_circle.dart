import 'dart:math';

import 'package:codelessly_interview/presentation/screens/homepage/components/radial_loading_circle/radial_loading_circle.painter.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class RadialLoadingCircle extends StatefulWidget {

  final double radius;
  
  /// Creates a loading glowing rainbow circle indicator.
  /// `radius = 0.2.hp`
  ///
  const RadialLoadingCircle({Key key, this.radius}) : super(key: key);

  @override
  _RadialLoadingCircleState createState() => _RadialLoadingCircleState();
}

class _RadialLoadingCircleState extends State<RadialLoadingCircle> {
  @override
  Widget build(BuildContext context) {
    /// We loop a spin animation.
    ///
    return LoopAnimation(
      tween: 0.0.tweenTo(2 * pi),
      duration: 1.5.seconds,
      builder: (_, child, value) => Transform.rotate(angle: value, child: child),
          child: Container(
        height: widget.radius ?? 0.2.hp,
        width: widget.radius ?? 0.2.hp,
        margin: EdgeInsets.symmetric(vertical: 0.05.hp),
        padding: EdgeInsets.all(0.025.wp),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color(0xff14ffe9),
              Color(0xffffeb3b),
              Color(0xffff00e0),
            ])),
        child: Stack(
          children: [

            /// Create the first two for the subtle blur effect on the base shape.
            /// Then we create the outside two to give off the glow effect.
            /// 
            BlurredCircleWidget(blurWidth: 0.02.wp, blurStrength: 2.5),
            BlurredCircleWidget(blurWidth: 0.04.wp, blurStrength: 5),
            BlurredCircleWidget(blurWidth: 0.1.wp, blurStrength: 12.5),
            BlurredCircleWidget(blurWidth: 0.2.wp, blurStrength: 25),

            /// The inner white circle placed on top of the whole stack.
            /// We can edit the child later on.
            ///
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
