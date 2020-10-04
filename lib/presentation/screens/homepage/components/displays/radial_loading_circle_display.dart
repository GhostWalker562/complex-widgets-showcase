import 'package:codelessly_interview/presentation/screens/homepage/components/radial_loading_circle/radial_loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadialLoadingCircleDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.025.hp),
      child: RadialLoadingCircle(),
    );
  }
}