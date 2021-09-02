import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';

/// A list of bindings which will be used in the route of [HomeView].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(),
        ),
      ),
    );
  }
}
