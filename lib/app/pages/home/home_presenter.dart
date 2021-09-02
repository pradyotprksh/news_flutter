import 'package:news_flutter/domain/domain.dart';

/// This will be talking to the other layers to retrieve the data.
class HomePresenter {
  HomePresenter(this._newsFeedUsecases, this._localUsecases);

  final NewsFeedUsecases _newsFeedUsecases;
  final LocalUsecases _localUsecases;

  /// Get news feed
  Future<NewsFeed> getNewsFeed() async => _newsFeedUsecases.getNewsFeed();

  /// Get local news
  Future<NewsFeed> getLocalNewsFeed() async =>
      _newsFeedUsecases.getLocalNewsFeed();

  /// Save news to local storage
  void saveNews(String details) {
    _localUsecases.saveNews(details);
  }
}
