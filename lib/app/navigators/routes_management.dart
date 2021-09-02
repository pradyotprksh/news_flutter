import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  /// Go to the splash screen.
  static void goToSplash() {
    Get.offNamed<void>(
      Routes.splashScreen,
    );
  }

  /// Go to the home screen.
  static void goToHome() {
    Get.offNamed<void>(
      Routes.homeScreen,
    );
  }
}
