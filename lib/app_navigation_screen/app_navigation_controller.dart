import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_theme.dart';
import '../app_utils.dart';
import '../routes/app_routes.dart';
import 'app_navigation_screen.dart';

/// This class defines the variables used in the [app_navigation_screen],
/// and is typically used to hold data that is passed between different parts of this class AppNavigationModel {}
/// A controller class for the AppNavigationScreen.
/// This class manages the state of the AppNavigationScreen, including the
/// current appNavigationModelObj
class AppNavigationController extends GetxController {
  Rx<AppNavigationModel> appNavigationModelObj = AppNavigationModel().obs;
}

class AppNavigationModel {
}

/// A binding class for the AppNavigationScreen.
/// This class ensures that the AppNavigationController is created when the
/// AppNavigationScreen is first loaded.
class AppNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppNavigationController());
  }
}