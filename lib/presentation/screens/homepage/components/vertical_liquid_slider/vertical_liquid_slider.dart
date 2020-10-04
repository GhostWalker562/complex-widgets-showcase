import 'dart:math';

import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:codelessly_interview/presentation/screens/homepage/components/vertical_liquid_slider/liquid.painter.widget.dart';
import 'package:flutter/material.dart';
// Resposivness
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class VerticalLiquidSlider extends StatefulWidget {
  final double height;
  final double width;
  final bool debug;

  /// Returns the __EXACT__ value of the slider's position.
  ///
  final Function(double) onChanged;

  /// Returns the rounded value from the `onChanged` function.
  /// This will round to the nearest tenth's place
  /// between `0.0-1.0`.
  ///
  final Function(double) onValueChanged;

  const VerticalLiquidSlider(
      {Key key,
      this.height = 100,
      this.width = 50,
      this.onChanged,
      this.onValueChanged,
      this.debug = false})
      : super(key: key);

  @override
  _VerticalLiquidSliderState createState() => _VerticalLiquidSliderState();
}

class _VerticalLiquidSliderState extends State<VerticalLiquidSlider>
    with AnimationMixin {
  /// `0.0-widget.height` value used
  /// for the slider's actual dimensions.
  ///
  Animation<double> sliderValue;

  /// `0.0-1.0` value used for the
  /// animation controller.
  ///
  double sliderValueNormalized = 0;

  /// To keep the waves an approriate size for
  /// different sizes of the slider.
  ///
  double amplitudeFactor = 1;

  /// Change color when dragging;
  ///
  bool isDragging = false;
  Color draggingColor;

  /// Controls the `controller.value` and `sliderValueNormalized`
  /// when the slider is dragged.
  ///
  /// `sliderValueNormalized` will always be `.clamp(0.0,1.0)`
  ///
  void _onVerticalDragUpdate(DragUpdateDetails details) {
    controller.animateTo(
        sliderValueNormalized + -details.delta.dy / widget.height,
        duration: 0.milliseconds,
        curve: Curves.easeInOutCubic);
    sliderValueNormalized =
        (sliderValueNormalized + (-details.delta.dy / widget.height))
            .clamp(0.0, 1.0);
    setState(() {
      isDragging = true;
      draggingColor = PALETTE[0];
    });
  }

  /// Controls the `controller.value` and `sliderValueNormalized`
  /// when the slider is tapped on.
  ///
  void _onTapDown(TapDownDetails details) {
    controller.animateTo(1 - details.localPosition.dy / widget.height,
        duration: 450.milliseconds, curve: Curves.bounceOut);
    sliderValueNormalized = 1 - details.localPosition.dy / widget.height;
  }

  /// Controls the `controller.value` and `sliderValueNormalized`
  /// when the slider is tapped on right before the user drags.
  ///
  void _onVerticalDragDown(DragStartDetails details) {
    controller.animateTo(1 - details.localPosition.dy / widget.height,
        duration: 200.milliseconds, curve: Curves.bounceOut);
    sliderValueNormalized = 1 - details.localPosition.dy / widget.height;
    setState(() {
      isDragging = true;
      draggingColor = PALETTE[0];
    });
  }

  @override
  void initState() {
    sliderValue = 0.0.tweenTo(widget.height).animatedBy(controller);
    amplitudeFactor = widget.width * 2 / widget.height;

    /// Increment/decrement any listern functions.
    ///
    controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged(sliderValueNormalized);
      }
      if (widget.onValueChanged != null) {
        widget.onValueChanged(
            double.parse(sliderValueNormalized.toStringAsFixed(1)));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onVerticalDragStart: _onVerticalDragDown,
      onVerticalDragUpdate: _onVerticalDragUpdate,
      onVerticalDragEnd: (details) => setState(() {
        isDragging = true;
        draggingColor = null;
      }),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset.zero, blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(45),
        ),
        constraints: BoxConstraints(
          maxWidth: widget.width,
        ),
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Container(
            decoration: BoxDecoration(
              color: PALETTE[5],
              borderRadius: BorderRadius.circular(45),
            ),
            child: AnimatedBuilder(
                animation: sliderValue,
                builder: (_, child) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      LiquidWave(
                        sliderValue.value,
                        amplitude: 0.06.hp * amplitudeFactor,
                        horizontalOffset: pi,
                        duration: 2.seconds,
                        debug: widget.debug,
                        color: draggingColor,
                      ),
                      LiquidWave(
                        sliderValue.value,
                        amplitude: 0.05.hp * amplitudeFactor,
                        horizontalOffset: 2 * pi,
                        duration: 4.seconds,
                        debug: widget.debug,
                        color: draggingColor,
                      ),
                      LiquidWave(
                        sliderValue.value,
                        amplitude: 0.07.hp * amplitudeFactor,
                        horizontalOffset: 3 * pi,
                        duration: 3.seconds,
                        debug: widget.debug,
                        color: draggingColor,
                      ),
                      LiquidWave(
                        sliderValue.value,
                        amplitude: 0.03.hp * amplitudeFactor,
                        horizontalOffset: 4 * pi,
                        duration: 3.5.seconds,
                        debug: widget.debug,
                        color: draggingColor,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
