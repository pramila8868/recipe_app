import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
//Retrieve a value using the key
  Future<String?> getLoginToken() async {
    return await _storage.read(key: 'token');
  }

//Store a value with a key
  Future<void> saveLoginToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> deleteLoginToken() async {
    await _storage.delete(key: 'token');
  }
}
