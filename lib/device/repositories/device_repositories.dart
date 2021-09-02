import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    const secureStorage = FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    var encryptionKey =
        base64Url.decode(await secureStorage.read(key: 'key') ?? '');
    await Hive.openBox<dynamic>(StringConstants.appName,
        encryptionCipher: HiveAesCipher(encryptionKey));
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
}
