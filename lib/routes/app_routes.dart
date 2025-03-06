// ignore_for_file: must_be_immutable
import 'package:get/get.dart';

import '../app_navigation_screen/app_navigation_screen.dart';
import '../k0_screen/k0_controller.dart';
import '../k0_screen/k0_screen.dart';
import '../one_screen/one_controller.dart';
import '../one_screen/one_screen.dart';

class AppRoutes {
  static const String k0Screen = '/k0_screen';
  static const String k1Screen = '/k1_screen';
  static const String oneScreen = '/one_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: k0Screen,
      page: () => K0Screen(),
      bindings: [K0Binding()],
    ),

    GetPage(
      name: oneScreen,
      page: () => OneScreen(),
      bindings: [OneBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      // bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => K0Screen(),
      bindings: [K0Binding()],
    ),
  ];
}