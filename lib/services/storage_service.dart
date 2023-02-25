import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/*
   Utk simpan token
   ref: https://blog.logrocket.com/securing-local-storage-flutter/
   ref: https://github.com/himanshusharma89/secure-storage/blob/master/lib/views/home_view.dart
*/
class StorageService {
  final _storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll(aOptions: _getAndroidOptions());
    } catch (e) {
      print(e);
    }
    return map;
  }

  Future<String?> readSecureData(String key) async {
    String? value = '';
    try {
      value = await _storage.read(
        key: key,
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(
        key: key,
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAll() async {
    try {
      _storage.deleteAll(aOptions: _getAndroidOptions());
    } catch (e) {
      print(e);
    }
  }

  /* Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureData(String key) async {
    var readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> deleteSecureData(StorageItem item) async {
    await _secureStorage.delete(key: item.key, aOptions: _getAndroidOptions());
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  Future<List<StorageItem>> readAllSecureData() async {
    var allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list =
        allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  } */

  // final _storage = const FlutterSecureStorage();
  //
  // Future<Map<String, String>> _readAll() async {
  //   var map = <String, String>{};
  //   try {
  //     map = await _storage.readAll(
  //       aOptions: _getAndroidOptions(),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  //   return map;
  // }
  //
  // Future<void> deleteAll() async {
  //   try {
  //     await _storage.deleteAll(
  //       aOptions: _getAndroidOptions(),
  //     );
  //     // _readAll();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future<String> readSecureData(String key) async {
  //   String value = "";
  //   try {
  //     value = (await _storage.read(key: key)) ?? "";
  //   } catch (e) {
  //     print(e);
  //   }
  //   return value;
  // }
  //
  // Future<void> deleteSecureData(String key) async {
  //   try {
  //     await _storage.delete(key: key);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // Future<void> writeSecureData(String key, String value) async {
  //   try {
  //     await _storage.write(
  //       key: key,
  //       value: value,
  //       aOptions: _getAndroidOptions(),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );
}
