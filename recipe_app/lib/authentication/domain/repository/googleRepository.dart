import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// class UserRepository {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<String?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;

//       final token = googleAuth.accessToken;
//       return token;
//     } catch (error) {
//       throw Exception('Failed to sign in with Google: $error');
//     }
//   }
// }

// class UserRepository {
//   static const String _baseUrl =
//       "https://api-dev.revelarena.com/v1/auth/social-auth/google-login";

//   Future<String?> authenticateUser(String accessToken) async {
//     try {
//       var response = await http.post(
//         Uri.parse('$_baseUrl/auth/google'),
//         headers: {'Content-Type': 'application/json'},
//         body: {'access_token': accessToken},
//       );

//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }

class GoogleSignInRepository {
  final Dio _dio = Dio();

  Future<String> signInWithGoogle(String token) async {
    try {
      final response = await _dio.post(
        'https://api-dev.revelarena.com/v1/auth/social-auth/google-login',
        data: {'token': token},
      );
      return response.data['auth_token'];
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
