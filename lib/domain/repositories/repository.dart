import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/device/device.dart';
import 'package:news_flutter/domain/domain.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository extends DomainRepository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  @override
  String getStringValue(String key) {
    try {
      return _dataRepository.getStringValue(key);
    } catch (_) {
      return _deviceRepository.getStringValue(key);
    }
  }

  @override
  Future<NewsFeed> getNewsFeed() async {
    try {
      return _dataRepository.getNewsFeed();
    } catch (_) {
      return _deviceRepository.getNewsFeed();
    }
  }

  @override
  List getListStringValue(String key) {
    try {
      return _dataRepository.getListStringValue(key);
    } catch (_) {
      return _deviceRepository.getListStringValue(key);
    }
  }

  @override
  void saveNews(dynamic details) {
    try {
      _dataRepository.saveNews(details);
    } catch (_) {
      _deviceRepository.saveNews(details);
    }
  }

  @override
  Future<NewsFeed> getLocalNewsFeed() async => _deviceRepository.getNewsFeed();
}
