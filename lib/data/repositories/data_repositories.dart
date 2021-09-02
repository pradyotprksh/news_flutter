import 'package:http/http.dart' as http;
import 'package:news_flutter/app/app.dart';
import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  @override
  Future<NewsFeed> getNewsFeed() async {
    if (await Utility.isNetworkAvailable()) {
      var url = Uri.parse(DataConstants.baseUrl);
      var response = await http.get(url);
      return NewsFeed.fromJson(response.body);
    } else {
      throw NetworkException(
        message: StringConstants.noInternet,
        errorCode: 500,
      );
    }
  }

  @override
  void saveNews(dynamic details) {
    throw UnimplementedError();
  }

  @override
  List<dynamic> getListStringValue(String key) {
    throw UnimplementedError();
  }

  @override
  Future<NewsFeed> getLocalNewsFeed() {
    throw UnimplementedError();
  }
}
