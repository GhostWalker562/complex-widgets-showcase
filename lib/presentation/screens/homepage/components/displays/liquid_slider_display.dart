import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/vertical_liquid_slider/vertical_liquid_slider.dart';
import 'package:codelessly_interview/presentation/universal/animations/scale_detector.dart';
import 'package:codelessly_interview/presentation/universal/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiquidSliderDisplay extends StatefulWidget {
  @override
  _LiquidSliderDisplayState createState() => _LiquidSliderDisplayState();
}

class _LiquidSliderDisplayState extends State<LiquidSliderDisplay> {
  double onChangedValue = 0;
  double onValueChangedValue = 0;

  // Debug button
  bool debug = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.025.hp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VerticalLiquidSlider(
            height: 0.5.hp,
            width: 0.1.wp,
            onValueChanged: (value) =>
                setState(() => onValueChangedValue = value),
            onChanged: (value) => setState(() => onChangedValue = value),
            debug: debug,
          ),
          Container(
            width: 0.6.wp,
            decoration: BoxDecoration(
                color: PALETTE[2], borderRadius: BorderRadius.circular(15)),
            padding:
                EdgeInsets.symmetric(horizontal: 0.04.wp, vertical: 0.01.hp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 0.075.hp,
                    margin: EdgeInsets.symmetric(vertical: 0.025.hp),
                    child: CustomText("onChangedValue: $onChangedValue")),
                Container(
                    height: 0.075.hp,
                    margin: EdgeInsets.symmetric(vertical: 0.025.hp),
                    child: CustomText("onValueChanged: $onValueChangedValue")),
                ScalingGestureDetector(
                  onTap: () => setState(() => debug = !debug),
                  end: 0.8,
                  child: Container(
                    height: 0.075.hp,
                    width: 0.075.hp,
                    padding: EdgeInsets.all(0.02.wp),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: debug ? PALETTE[3] : PALETTE[4],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomText("debug", maxLines: 1,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
