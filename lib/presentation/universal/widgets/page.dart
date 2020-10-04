import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaddedPage extends StatelessWidget {
  final List<Widget> children;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  const CustomPaddedPage(
      {Key key,
      this.children,
      this.color,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.055.wp, vertical: 0.05.hp),
      color: color,
      child: Column(mainAxisAlignment: mainAxisAlignment, children: children),
    );
  }
}
