import 'dart:convert';

//import '../../../model/model.dart';

import 'package:http/http.dart' as http;

// class SignUpRepository {
//   var apiUrl =
//       "https://api-dev.revelarena.com/api/docs/#/auth/auth_normal_user_register_create";
//   //  "https://68f5-27-34-48-131.in.ngrok.io/v1/auth/normal-user-register";
//   Future<UserDetail> createUser(UserDetail userDetail
//       //String name, String phnumber, String email,
//       // String password, String invitationCode
//       ) async {
//     final response = await http.post(Uri.parse(apiUrl),
//         headers: <String, String>{
//           "Content-Type": "application/json; charset=UTF-8"
//         },
//         body: jsonEncode(userDetail.toJson() //<String, String>{
//             // "fullname": name,
//             // "phoneNumber": phnumber,
//             // "email": email,
//             // "password": password,
//             // "invitationCode": invitationCode
//             // // repassword: "repassword"
//             //}
//             ));
//     print(response.body);
//     print(response.statusCode);
//     if (response.statusCode == 201) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       //__________-------
//       UserDetail detailList = UserDetail.fromJson(data);
//       print(data);
//       return detailList;
//       // return UserDetail.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception("Failed to create users");
//     }
//   }
// }
//______________________________________________________-
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
//   }
// }

//__________________________________





// Future<UserDetail> createUser(
//   String name,
//   String job,
// ) async {
//   final response = await http.post(Uri.parse(apiUrl),
//       headers: <String, String>{
//         "Content-Type": "applocation/json; charset=UTF-8"
//       },
//       body: jsonEncode(<String, String>{"name": name, "job": job}));
//   if (response.statusCode == 201) {
//     return UserDetail.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception("Failed to create users");
//   }
// }
