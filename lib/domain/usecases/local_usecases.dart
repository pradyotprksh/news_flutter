import 'package:news_flutter/domain/domain.dart';

/// Use case for getting the data from local database
class LocalUsecases {
  /// [_repository] : takes the repository to get the data
  LocalUsecases(this._repository);

  final Repository _repository;

  /// Get the string value for the [key].
  String getStringValue(String key) => _repository.getStringValue(key);

  /// Save news to local storage
  void saveNews(String details) {
    _repository.saveNews(details);
  }
}
