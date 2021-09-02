import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';

/// The splash view which will show the splash screen and perform the basic
/// ui work.
class SplashView extends StatelessWidget {
  const SplashView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<SplashController>(
        init: Get.find()?..goToHome(),
        builder: (_controller) => Scaffold(
          backgroundColor: Get.theme.primaryColor,
          body: Center(
            child: Text(
              StringConstants.appName,
              style: Styles.bold30,
            ),
          ),
        ),
      );
}
