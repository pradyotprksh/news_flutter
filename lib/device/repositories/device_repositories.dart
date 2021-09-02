import 'package:hive/hive.dart';
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/device/device.dart';
import 'package:news_flutter/domain/domain.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// Initialize hive
  Future<void> init() async {
    var directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox<dynamic>(StringConstants.appName);
  }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  String getStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as String?;
    if (key == DeviceConstants.localLang) {
      value ??= DataConstants.defaultLang;
    }
    return value ?? '';
  }

  @override
  Future<NewsFeed> getNewsFeed() async {
    var news = getListStringValue(DeviceConstants.news);
    var output = '{"status": "ok", "articles": $news}';
    return NewsFeed.fromJson(output);
  }

  @override
  void saveNews(dynamic details) {
    var news = getListStringValue(DeviceConstants.news);
    var newNews = <dynamic>[...news, details];
    _getBox().put(DeviceConstants.news, newNews);
  }

  @override
  List<dynamic> getListStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as List<dynamic>?;
    value ??= <Map<String, String>>[];
    return value;
  }

  @override
  Future<NewsFeed> getLocalNewsFeed() => getNewsFeed();
}
