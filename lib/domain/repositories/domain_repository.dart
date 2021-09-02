import 'package:news_flutter/domain/domain.dart';

/// Abstract classes that define functionality for data and device layers
abstract class DomainRepository {
  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key);

  /// Get list of data for the [key].
  ///
  /// [key] : The key whose value is needed
  List<dynamic> getListStringValue(String key);

  /// Get news feed
  Future<NewsFeed> getNewsFeed();

  /// Get local news
  Future<NewsFeed> getLocalNewsFeed();

  /// Save a news offline
  void saveNews(dynamic details);
}
