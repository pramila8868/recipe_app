// ignore_for_file: avoid_print


// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';
import 'package:recipe_app/authentication/data/api/api.dart';

import '../../../common/Dio/url.dart';

class LoginPostRepository {
  Api apiLogin = Api();
  String apiurl = Globals().logInUrl;
  Future<LoginDetail> logInUser(String name, String password) async {
    Map<String, dynamic> map = {
      "username": name,
      "password": password,
    };
    // ignore: avoid_print
    print(map);
    //const apiUrl = url;
    //  "https://api-dev.revelarena.com/v1/auth/normal-user-register";

    final response = await apiLogin.dio.post(
      apiurl,
      data: map,
      options: Options(
        contentType: "application/json; charset=UTF-8",
      ),
    );
    print(response);
    print(response.statusCode);

    final Map<String, dynamic> body = response.data;

    return LoginDetail.fromJson(body);
    //  return UserDetail.fromJson(response.data);
    // } else {
    //   throw NoInternetConnectionException(response.requestOptions);
  }
}



















//__________________________________________
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
//       final response = await _dio.post(
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

//         //final Map<String, dynamic> body =
//         //    json.decode(json.encode(response.data));
//         //   UserDetail userdetaillists = UserDetail.fromJson(body);
//         //  return userdetaillists;
//         return UserDetail.fromJson(response.data);
//       } else {
//         throw Exception("Failed to create user");
//       }
//     } catch (e) {
//       print(e);
//       throw Exception("Failed to create user: ${e.toString()}");
//     }
//   }
// }
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

