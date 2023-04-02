import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/authentication/data/Model/googleModel.dart';
import 'package:recipe_app/authentication/data/api/api.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';
import 'package:recipe_app/common/Dio/url.dart';

final Dio _dio = Dio();
LoginStorageService _loginStorageService = LoginStorageService();
//FlutterSecureStorage _storage = FlutterSecureStorage();

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

  Future<GoogleModel> signInWithGoogle(String token) async {
    Map bodyToken = {"code": token};
    // String url = Globals().googleUrl;
    String url = globals.baseUrl + globals.googleUrl;
    final response = await apiLogin.dio.post(
      url,
      data: bodyToken,
      options: Options(
        contentType: "application/json; charset=UTF-8",
      ),
    );
    print(response);
    final Map<String, dynamic> body = response.data;
    // print(response.data['refresh']);
    final refreshToken = response.data['refresh'];
    print(refreshToken);
    Future token1 = _loginStorageService.saveLoginToken("key", refreshToken);
    print(token1);
    Future token11 = _loginStorageService.getLoginToken("key");
    print(token11);
    final accessToken = response.data['access'];
    Future token2 = _loginStorageService.saveLoginToken("key1", accessToken);
    print(token2);
    Future token22 = _loginStorageService.getLoginToken("key1");
    print(token22);
    print(accessToken);
    print(response.data['access']);
    GoogleModel googleModel = GoogleModel.fromJson(body);
    print(googleModel);
    //print(googleModel);
    return googleModel;
  }

//   Future signInWithGoogle( String token,
//       //String googleToken

//       ) async {
//     //try {
// //     final googleUser = await googleSignIn.signIn();
// //     print(googleUser);
// // //print(googleUser.serverAuthCode);
// //     if (googleUser == null) return;
//    //  final token = googleUser.serverAuthCode;
// //     print(googleUser.serverAuthCode);

//     Map bodyData = {
//       'code': token //googleToken,
//     };

//     String url = globals.baseUrl + globals.googleUrl;
//     print(globals.baseUrl + globals.googleUrl);
//     final response = await apiLogin.dio.post(
//       url,
//       data: bodyData,
//     );
//     print(response.statusCode);
//     print(response);
//     print(" data is $response.data");
//     Map serverToken = response.data;
//     // if (response.statusCode == 200) {
//     //final serverToken = response.data; //[0]['messsage'].toString();
//     // final Map<String, dynamic> serverToken = response.data; //['message'];
//     //_storage.write(key: 'token', value: serverToken.toString());
//     // print(serverToken);
//     // return serverToken;
//     return serverToken; //response.data;
//   }
}
