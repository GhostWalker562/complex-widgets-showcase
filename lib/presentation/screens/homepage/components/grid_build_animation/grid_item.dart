import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:codelessly_interview/presentation/universal/animations/scale_detector.dart';
import 'package:flutter/material.dart';
// Resposivness
// Animations
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return PlayAnimation(

        /// Delays the animation play diagonally.
        ///
        delay: 250.milliseconds * (index % 4 + (index / 4).round()),
        duration: 0.25.seconds,
        curve: Curves.bounceOut,
        tween: 0.0.tweenTo(1.00),
        builder: (BuildContext context, Widget child, value) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: ScalingGestureDetector(
          end: 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: PALETTE[5]),
            ),
          ),
        ));
  }
}
