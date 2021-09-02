import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';

/// The home view which will show the home screen and perform the basic
/// ui work.
class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Scaffold(
          backgroundColor: Get.theme.backgroundColor,
        ),
      );
}
