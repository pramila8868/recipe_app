import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';
import 'package:recipe_app/authentication/data/api/api.dart';

import '../../../../common/Dio/url.dart';
import '../../../data/Model/model.dart';

class LoginPostRepository {
  Api apiLogin = Api();
  String apiurl = Globals().logInUrl;
  Future<LoginDetail> logInUser(String name, String password) async {
    Map<String, dynamic> map = {
      "username": name,
      "password": password,
    };
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







// class PostRepository {
//   Api api = Api();

//   Future<List<UserDetail>> createUser(String name, String phnumber,
//       String email, String password, String invitationCode) async {
//     Map<String, dynamic> map = {
//       "fullname": name,
//       "phoneNumber": phnumber,
//       "email": email,
//       "password": password,
//       "invitationCode": invitationCode
//     };
//     print(map);
//     const apiUrl = "/v1/auth/normal-user-register";
//     //  "https://api-dev.revelarena.com/v1/auth/normal-user-register";
//     try {
//       final response = await api.dio.post(
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

//       if (response.data != null) {
//         final body =
//             (response.data as List).map((e) => UserDetail.fromJson(e)).toList();
//         // final result = json.((e) {
//         //   return UserDetail(
//         //       phoneNumber: e['phoneNumber'],
//         //       password: e['password'],
//         //       invitationCode: e['invitationCode'],
//         //       email: e["email"],
//         //       fullname: e['fullname']
//         //       // name: e["fullname"]
//         //       );
//         // }).toList();
//         // return result;
//         print(body);
//         return body;
//         //  return UserDetail.fromJson(response.data);
//         // } else {
//         //   throw NoInternetConnectionException(response.requestOptions);
//       } else {
//         throw ("null");
//       }
//     } on DioError catch (e) {
//       print(e);
//       throw (e);
//     }
//   }
// }

// } catch (e) {
//   print(e);
//   if (e is DioError) {
//     throw e;
//   } else {
//     throw Exception("Failed to create user:${e.toString()}");
//   }
// }
//     if (response.statusCode == 201) {
//       print(response.data);
//       print(response.statusCode);

//       final Map<String, dynamic> body =
//           json.decode(json.encode(response.data));
//       UserDetail userdetaillists = UserDetail.fromJson(body);
//       return userdetaillists;
//       // return UserDetail.fromJson(response.data);
//     } else {
//       throw Exception("Failed to create user");
//     }
//   } catch (e) {
//     print(e);
//     throw Exception("Failed to create user: ${e.toString()}");
//   }
// }
//}
//}







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
//     String apiUrl =
//         "https://api-dev.revelarena.com/api/docs/#/auth/auth_normal_user_register_create";
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
//       throw Exception("Failed to create user: ${e.toString()}");
//     }
//   }
// }

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
//         options: Options(contentType: "application/json; charset=UTF-8"),
//       );
//       print(response);
//       print(response.statusCode);

//       if (response.statusCode == 201) {
//         print(response.data);
//         print(response.statusCode);
//         return UserDetail.fromJson(response.data);
//       } else if (response.statusCode == 400) {
//         throw BadRequestException(response.requestOptions);
//       } else {
//         throw Exception("Failed to create user");
//       }
//     } on DioError catch (e) {
//       if (e.response?.statusCode == 400) {
//         throw BadRequestException(e.requestOptions);
//       }
//       print(e);
//       throw Exception("Failed to create user: ${e.toString()}");
//     }
//   }
// }

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

// class SignUpRepository {

//   var apiUrl =
//       "https://api-dev.revelarena.com/api/docs/#/auth/auth_normal_user_register_create";
//   //  "https://68f5-27-34-48-131.in.ngrok.io/v1/auth/normal-user-register";
//   Future<UserDetail> createUser(String name, String phnumber, String email,
//       String password, String invitationCode) async {
//     final response = await http.post(Uri.parse(apiUrl),
//         headers: <String, String>{
//           "Content-Type": "application/json; charset=UTF-8"
//         },
//         body: jsonEncode(//userDetail.toJson()
//             <String, String>{
//           "fullname": name,
//           "phoneNumber": phnumber,
//           "email": email,
//           "password": password,
//           "invitationCode": invitationCode
//           // repassword: "repassword"
//         }));
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 201) {
//      // final Map<String, dynamic> data = json.decode(response.body);
//       // __________
//       //UserDetail detailList = UserDetail.fromJson(data);
//      // print(data);
//      // return detailList;
//       // ignore: dead_code
//       return UserDetail.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("Failed to create users");
//     }
//       }
//   catch(e){
//     throw Exception(e.toString());
//   }
//       }
// }
