import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final box = GetStorage();

  dynamic getValueFor(String localKey) {
    return box.read(localKey);
  }

  addValueFor(String localKey, dynamic value) {
    box.write(localKey, value);
  }
}

class LocalStorageKeys {
  static const userLoggedIn = 'userLoggedIn';
}
