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
  String getStringValue(String key) => _deviceRepository.getStringValue(key);
}
