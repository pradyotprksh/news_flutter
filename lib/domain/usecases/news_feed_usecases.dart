import 'package:news_flutter/domain/domain.dart';

/// An use case for getting the news feed from the domain
class NewsFeedUsecases {
  NewsFeedUsecases(this._repository);

  final Repository _repository;

  /// Get news feed
  Future<NewsFeed> getNewsFeed() async => _repository.getNewsFeed();

  /// Get local news
  Future<NewsFeed> getLocalNewsFeed() async => _repository.getLocalNewsFeed();
}
