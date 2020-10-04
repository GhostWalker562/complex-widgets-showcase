import 'package:codelessly_interview/presentation/screens/homepage/components/grid_build_animation/animated_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridBuildAnimationDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.025.hp),
      child: AnimatedGrid(),
    );
  }
}
