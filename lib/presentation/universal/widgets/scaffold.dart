import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomVerticalPageViewScaffold extends StatelessWidget {
  final List<Widget> children;

  const CustomVerticalPageViewScaffold({Key key, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PALETTE[4],
      body: Container(
          child: PageView(
            scrollDirection: Axis.vertical,
        physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: children,
      )),
    );
  }
}
