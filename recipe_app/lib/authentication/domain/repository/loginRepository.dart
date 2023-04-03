// ignore_for_file: avoid_print

// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:recipe_app/authentication/data/Model/googleModel.dart';
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';
import 'package:recipe_app/authentication/data/api/api.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';

import '../../../common/Dio/url.dart';

// class LoginPostRepository {
//   Api apiLogin = Api();
//   String apiurl = Globals().logInUrl;
//   Future<LoginDetail> logInUser(String name, String password) async {
//     Map<String, dynamic> map = {
//       "username": name,
//       "password": password,
//     };

//     final response = await apiLogin.dio.post(
//       apiurl,
//       data: map,
//       options: Options(
//         contentType: "application/json; charset=UTF-8",
//       ),
//     );
//     print(response);
//     print(response.statusCode);

//     final Map<String, dynamic> body = response.data;
//     print(body);
//     print("body is $body");
//     return LoginDetail.fromJson(body);
//     //  return UserDetail.fromJson(response.data);
//     // } else {
//     //   throw NoInternetConnectionException(response.requestOptions);
//   }
// }

class LoginPostRepository {
  LoginStorageService _loginStorageService = LoginStorageService();
  Globals globals = Globals();
  Api apiLogin = Api();

  // String apiurl = Globals().logInUrl;
  Future<ResponseModel> logInUser(String name, String password) async {
    Map<String, dynamic> map = {
      "username": name,
      "password": password,
    };
    String apiurl = globals.baseUrl + globals.logInUrl;
    final response = await apiLogin.dio.post(
      apiurl,
      data: map,
      // options: Options(headers: {'Range': 'bytes=0-9999'}),
      // options: Options(
      //   contentType: "application/json; charset=UTF-8",
      // ),
    );
    print(response);
    print(response.statusCode);
    final responseData = response.data;
    final refreshData = responseData['refresh'];
    print(refreshData);
    print("PRINT");
    // Future token1 = _loginStorageService.saveLoginToken("key", refreshData);
    // print(token1);
    // Future token11 = _loginStorageService.getLoginToken("key");
    // print("refreshToken is $token11");
    // print('_______________');

    String? token1 = await _loginStorageService.saveLoginToken("refreshToken",
        refreshData); // String? to allow it to accept null values:
    print(token1);
    String? token11 = await _loginStorageService.getLoginToken("refreshToken");
    print("refreshToken is $token11");
    print('_______________');
    final accessData = responseData['access'];
    print(accessData);
    String? token2 =
        await _loginStorageService.saveLoginToken("accessToken", accessData);
    print(token2);
    String? token22 = await _loginStorageService.getLoginToken("accessToken");
    print(token22);
    print('accessToken is $token22');
    print("Response of login is $refreshData");
    // //final Map<String, dynamic> body = response.data;
    //print(body);
    print("Response of login is $response.data['refresh']");
    // //  print("body is $body");
    // final ResponseModel loginResponse =
    //     ResponseModel.fromJson(response.data['access']);
    // print(loginResponse);
    //final googelModel =  ResponseModel.fromJson(jsonDecode(response.data));//ResponseModel.fromJson(response.data);
    //print(googelModel);
    //print(ResponseModel.fromJson(response.data["access"]));
    //return LoginDetail.fromJson(body);
    //print(ResponseModel.fromJson(response.data['refresh']));
    // print(ResponseModel.fromJson(jsonDecode(response.data.toString())));
    // return ResponseModel.fromJson(jsonDecode(response.data.toString()));
    //print(ResponseModel.fromJson(response.data['refresh']));
    ResponseModel? model = ResponseModel.fromJson(response.data);
    print(model);
    return model; //ResponseModel.fromJson(response.data);
    //  return UserDetail.fromJson(response.data);
    // } else {
    //   throw NoInternetConnectionException(response.requestOptions);
  }
}




















//___________________________________________________________

// class SignUpRepository {
//   final _dio = Dio();
//   Future<UserDetail> createUser(String name, String phnumber, String email,
//       String password, String invitationCode) async {
//     Map<String, dynamic> map = {
//       "fullname": name,
//       "phoneNumber": phnumber,
//       "email": email,
//       "password": password,
//       "invitationCode": invitationCode
//     };
//     print(map);
//     const apiUrl =
//         "https://api-dev.revelarena.com/v1/auth/normal-user-register";
//     try {
//       final response = await _dio.post<Map<String, dynamic>>(
//         apiUrl,
//         data: map,

//         // data: map={
//         //   "fullname": name,
//         //   "phoneNumber": phnumber,
//         //   "email": email,
//         //   "password": password,
//         //   "invitationCode": invitationCode
//         // },

//         options: Options(contentType: "application/json; charset=UTF-8"),
//       );
//       print(response);
//       print(response.statusCode);

//       if (response.statusCode == 201) {
//         print(response.data);
//         print(response.statusCode);

//         final Map<String, dynamic> body =
//             json.decode(json.encode(response.data));
//         UserDetail userdetaillists = UserDetail.fromJson(body);
//         return userdetaillists;
//         // return UserDetail.fromJson(response.data);
//       } else {
//         throw Exception("Failed to create user");
//       }
//     } catch (e) {
//       print(e);
//       throw Exception("Failed to create user: ${e.toString()}");
//     }
//   }
// }

