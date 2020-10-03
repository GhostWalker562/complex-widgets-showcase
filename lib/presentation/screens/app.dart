import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphics_notebook/presentation/constants/constants.dart';

class MyApp extends StatelessWidget {
  void init(BuildContext context) {
    ScreenUtil.init(context, height: 1920, width: 1080, allowFontScaling: true);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          home: Builder(builder: (context) {
            /// [return Home Page]
            // return Homepage();
          }),
          builder: ExtendedNavigator.builder(
            router: AutoRouter(),
            builder: (context, child) {
              init(context);
              return child;
            },
          )),
    );
  }
}
