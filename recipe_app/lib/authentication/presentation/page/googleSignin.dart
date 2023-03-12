
import 'package:google_sign_in/google_sign_in.dart';
final GoogleSignIn _googleSignIn = GoogleSignIn();

void _handleGoogleSignIn() async {
  try {
    await _googleSignIn.signIn();
    final googleUser = _googleSignIn.currentUser;
    print('Google User: ${googleUser!.displayName}');
  } catch (error) {
    print(error);
  }
}
