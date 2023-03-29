import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/authentication/data/api/api.dart';
import 'package:recipe_app/common/Dio/url.dart';

final Dio _dio = Dio();
FlutterSecureStorage _storage = FlutterSecureStorage();

//   Future<String> signInWithGoogle(String googleToken)
// async {
//     try {
//       final response = await _dio.post(
//         'https://api-dev.revelarena.com/v1/auth/social-auth/google-login',
//        // '/auth/google',
//         data: {'token': googleToken},
//       );
//       final accessToken = response.data['access_token'] as String;
//       await _secureStorage.write(key: 'access_token', value: accessToken);
//       return accessToken;
//     } catch (e) {
//       throw Exception('Failed to sign in with Google: ${e.toString()}');
//     }
//   }
// }
//idToken is used to authenticate the user to your own backend server or service.idToken contains user profile information and can be verified using Google's public keys to ensure that it was issued by Google and that the information it contains is accurate.
class UserRepository {
  Api apiLogin = Api();
  Globals globals = Globals();

  GoogleSignIn googleSignIn = GoogleSignIn();
//GoogleSignIn.debugLoggingEnabled = true;
  Future signInWithGoogle(
      //String googleToken

      ) async {
    //try {
    final googleUser = await googleSignIn.signIn();
    print(googleUser);
   
//print(googleUser.serverAuthCode);
    if (googleUser == null) return;

    final token = googleUser.serverAuthCode;
    print(googleUser.serverAuthCode);

    Map bodyData = {
      'code': token //googleToken,
    };

    String url = globals.baseUrl + globals.googleUrl;
    print(globals.baseUrl + globals.googleUrl);
    final response = await apiLogin.dio.post(
      url,
      data: bodyData,
    );
    print(response.statusCode);
    print(response);
    print(" data is $response.data");
    Map serverToken = response.data;
    // if (response.statusCode == 200) {
    //final serverToken = response.data; //[0]['messsage'].toString();
    // final Map<String, dynamic> serverToken = response.data; //['message'];
    _storage.write(key: 'token', value: serverToken.toString());
    // print(serverToken);
    // return serverToken;
    return serverToken; //response.data;
  }

  // dicontinue() async {
  //   googleSignIn.disconnect();
  //   await _storage.delete(key: 'token');
  //   print('disconnected');
  // }
}
