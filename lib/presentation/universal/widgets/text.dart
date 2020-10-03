import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphics_notebook/presentation/constants/constants.dart';

enum clr { DARK, LIGHT, ACCENT }
enum siz { TITLE, SUBTITLE, HEADER, ERROR, LARGE, SMALL }

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(this.text,
      {Key key,
      this.size,
      this.color,
      this.opacity = 1,
      this.weight,
      this.textAlign})
      : super(key: key);

  final siz size;
  final clr color;
  final String text;
  final FontWeight weight;
  final double opacity;
  final TextAlign textAlign;

  double fontSize;
  Color appliedColor;

  void modulate() {
    applyFontSize();
    applyColor();
  }

  void applyFontSize() {
    switch (size) {
      case siz.TITLE:
        fontSize = 64;
        break;
      case siz.HEADER:
        fontSize = 38;
        break;
      case siz.LARGE:
        fontSize = 24;
        break;
      case siz.ERROR:
        fontSize = 24;
        break;
      case siz.SUBTITLE:
        fontSize = 18;
        break;
      case siz.SMALL:
        fontSize = 16;
        break;
      default:
        fontSize = 18;
    }
  }

  void applyColor() {
    switch (color) {
      case clr.DARK:
        appliedColor = FONTCOLORS[0];
        break;
      case clr.LIGHT:
        appliedColor = FONTCOLORS[1];
        break;
      case clr.ACCENT:
        appliedColor = Colors.red.shade300;
        break;
      default:
        appliedColor = FONTCOLORS[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    modulate();
    return AutoSizeText(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.fade,
      style: GoogleFonts.sourceCodePro(
        color: appliedColor.withOpacity(opacity),
        fontSize:
            ScreenUtil().setSp(fontSize + 0.05.wp, allowFontScalingSelf: true),
        fontWeight: weight,
      ),
    );
  }
}
