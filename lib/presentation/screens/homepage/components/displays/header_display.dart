import 'package:codelessly_interview/presentation/universal/widgets/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Displays a header text with a description.
///
class HeaderDisplay extends StatelessWidget {
  final String title;
  final String desc;

  const HeaderDisplay({Key key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.025.hp),
        padding: EdgeInsets.only(right: 0.15.wp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title ?? "",
              size: siz.GIANTTITLE,
              weight: FontWeight.bold,
            ),
            CustomText(
              desc ?? "",
              size: siz.HEADER,
            )
          ],
        ));
  }
}
