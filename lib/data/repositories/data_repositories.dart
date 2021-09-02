import 'package:news_flutter/data/data.dart';
import 'package:news_flutter/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [_connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this._connectHelper);

  final ConnectHelper _connectHelper;

  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }
}
