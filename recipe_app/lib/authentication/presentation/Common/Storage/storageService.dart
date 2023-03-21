// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/onboarding/presentation/page/onboarding_screen1.dart';
// ignore: non_constant_identifier_names
//  class StorageService{
// final storage = FlutterSecureStorage();

//   Future<String?> getToken() async {
//     return await storage.read(key: 'token');
//   }

//   Future<void> setToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }
//   Future<void> removeToken() async {
//     await storage.delete(key: 'token');
//   }
// }

// class NavigationService {
//   static final FlutterSecureStorage storage = FlutterSecureStorage();

//   static Future navigate(BuildContext context) async {
//     final isFirstTime = await storage.read(key: 'isFirstTime') ?? 'true';

//     if (isFirstTime == 'true') {
//       await storage.write(key: 'isFirstTime', value: 'false');
//       Navigator.pushReplacementNamed(context, const OnBoarding1() as String);
//     } else {
//       Navigator.pushReplacementNamed(context, const LoginScreen() as String) //'/home')
//       ;
//     }
//   }
// }

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
