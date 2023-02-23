import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  // Future<void> writeSecureData(StorageItem newItem) async {
  //   await _secureStorage.write(
  //       key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  // }
}
