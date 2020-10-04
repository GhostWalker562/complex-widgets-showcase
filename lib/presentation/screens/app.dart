import 'package:auto_route/auto_route.dart';
import 'package:codelessly_interview/presentation/constants/constants.dart';
import 'package:codelessly_interview/presentation/screens/homepage/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router.gr.dart';

class MyApp extends StatelessWidget {
  void init(BuildContext context) {
    ScreenUtil.init(context, height: 1920, width: 1080, allowFontScaling: true);
  }

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [],
    //   child: 
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          home: Builder(builder: (context) {
            /// [return Home Page]
            return Homepage();
          }),
          builder: ExtendedNavigator.builder(
            router: AutoRouter(),
            builder: (context, child) {
              init(context);
              return child;
            },
          )
          );
    // );
  }
}
