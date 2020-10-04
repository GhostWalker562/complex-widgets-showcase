// import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:codelessly_interview/presentation/screens/homepage/homepage.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    /// initial route is named "/"
    MaterialRoute(page: Homepage, path: "/", initial: true),
  ],
)
class $AutoRouter {}
