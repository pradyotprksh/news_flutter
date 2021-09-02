import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/domain/domain.dart';

/// The home controller which will be used to control the [HomeView].
class HomeController extends GetxController {
  HomeController(this._homePresenter);

  final HomePresenter _homePresenter;
  NewsFeed? newsFeed;
  PageStatus pageStatus = PageStatus.idle;
  StreamSubscription? _subscription;

  @override
  void onInit() {
    callInitialApis();
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        pageStatus = PageStatus.offline;
      } else {
        pageStatus = PageStatus.online;
      }
      callInitialApis();
    });
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  /// Call initial apis
  void callInitialApis() async {
    pageStatus = PageStatus.loading;
    update();
    await _getNewsFeed();
    update();
  }

  /// Get the list of news from
  Future<void> _getNewsFeed() async {
    try {
      newsFeed = await _homePresenter.getNewsFeed();
      pageStatus = PageStatus.success;
    } catch (exception) {
      newsFeed = await _homePresenter.getLocalNewsFeed();
      pageStatus = PageStatus.offline;
      Utility.showMessage(
        exception.toString(),
        MessageType.error,
        null,
        StringConstants.okay,
      );
    }
  }

  /// Save a news in local storage
  void markNewsOffline(Article article) {
    _homePresenter.saveNews(json.encode(article.toMap()));
  }
}
