import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final token = googleAuth.accessToken;
      return token;
    } catch (error) {
      throw Exception('Failed to sign in with Google: $error');
    }
  }
}
