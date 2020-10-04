import 'package:auto_size_text/auto_size_text.dart';
import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

enum clr { DARK, LIGHT, ACCENT }

/// __GIANTTITLE__ = 72
///
/// __TITLE__ = 64
/// 
/// __SUBTITLE__ = 32
/// 
/// __HEADER__ = 24
/// 
/// __ERROR__ = 24
/// 
/// __LARGE__ = 18
/// 
/// __SMALL__ = 16
/// 
/// __[DEFAULT]__ = 18
enum siz {GIANTTITLE,  TITLE, SUBTITLE, HEADER, ERROR, LARGE, SMALL }

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(this.text,
      {Key key,
      this.size,
      this.color,
      this.opacity = 1,
      this.weight,
      this.textAlign, this.margin, this.maxLines})
      : super(key: key);

  final siz size;
  final clr color;
  final String text;
  final FontWeight weight;
  final double opacity;
  final TextAlign textAlign;
  final EdgeInsets margin;
  final int maxLines;

  double fontSize;
  Color appliedColor;

  void modulate() {
    applyFontSize();
    applyColor();
  }

  void applyFontSize() {
    switch (size) {
      case siz.GIANTTITLE:
        fontSize = 72;
        break;
      case siz.TITLE:
        fontSize = 64;
        break;
      case siz.HEADER:
        fontSize = 32;
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
    return Container(
      margin: margin,
      child: AutoSizeText(
        text,
        maxLines: maxLines,
        textAlign: textAlign ?? TextAlign.left,
        overflow: TextOverflow.fade,
        style: GoogleFonts.rubik(
          color: appliedColor.withOpacity(opacity),
          fontSize:
              ScreenUtil().setSp(fontSize + 0.1.wp, allowFontScalingSelf: true),
          fontWeight: weight,
        ),
      ),
    );
  }
}
