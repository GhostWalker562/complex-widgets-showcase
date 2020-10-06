import 'package:codelessly_interview/presentation/screens/homepage/components/grid_build_animation/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedGrid extends StatelessWidget {
  const AnimatedGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 0.025.hp),
        physics: BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0.075.wp,
            crossAxisSpacing: 0.075.wp,
            crossAxisCount: 4),
        itemCount: 16,
        itemBuilder: (context, index) {
          return GridItem(
            index: index,
          );
        });
  }
}
