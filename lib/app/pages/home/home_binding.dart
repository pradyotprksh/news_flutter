import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/domain/domain.dart';

/// A list of bindings which will be used in the route of [HomeView].
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(
            Get.put(
              NewsFeedUsecases(
                Get.find(),
              ),
              permanent: true,
            ),
            Get.find(),
          ),
        ),
      ),
    );
  }
}
