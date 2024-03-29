import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
//Retrieve a value using the key
  // String key="token";
  Future getLoginToken(String key) async {
    return await _storage.read(key: key);
  }

//Store a value with a key
  Future saveLoginToken(String key, String token) async {
    await _storage.write(key: key, value: token);
  }

  Future deleteLoginToken(String key) async {
    await _storage.delete(key: key);
  }
}
