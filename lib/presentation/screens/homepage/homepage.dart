import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/displays/grid_build_animation_display.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/displays/header_display.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/displays/liquid_slider_display.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/displays/radial_loading_circle_display.dart';
import 'package:codelessly_interview/presentation/universal/widgets/page.dart';
import 'package:codelessly_interview/presentation/universal/widgets/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomVerticalPageViewScaffold(
      children: [
        CustomPaddedPage(
          color: PALETTE[3],
          children: [
            // Header
            HeaderDisplay(
              title: "Fluid Slider",
              desc: "Responsive vertical fluid slider.",
            ),
            // Display
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0.1.hp),
                    child: LiquidSliderDisplay())),
          ],
        ),
        CustomPaddedPage(
          color: PALETTE[2],
          children: [
            // Header
            HeaderDisplay(
              title: "Radial Loading Animation",
              desc: "Spinning glowing circle.",
            ),
            // Display
            Expanded(child: Center(child: RadialLoadingCircleDisplay())),
          ],
        ),
        CustomPaddedPage(
          color: PALETTE[0],
          children: [
            // Header
            HeaderDisplay(
              title: "Animated Bouncing Grid",
              desc: "Staggered scaling bouncing animation.",
            ),
            // Display
            Expanded(child: Center(child: GridBuildAnimationDisplay())),
          ],
        ),
      ],
    );
  }
}
