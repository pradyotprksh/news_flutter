import 'package:get/get.dart';
import 'package:news_flutter/data/data.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper extends GetConnect {
  @override
  void onInit() {
    httpClient
      ..baseUrl = DataConstants.baseUrl
      ..timeout = const Duration(
        milliseconds: 500,
      )
      ..maxAuthRetries = 2
      ..maxRedirects = 2;
    super.onInit();
  }
}
