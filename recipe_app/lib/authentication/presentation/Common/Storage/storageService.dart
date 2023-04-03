// ignore_for_file: use_build_context_synchronously

// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
//Retrieve a value using the key
  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

//Store a value with a key
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }
}
