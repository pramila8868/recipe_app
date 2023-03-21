import 'package:bloc/bloc.dart';
import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/login_state.dart';
import 'package:recipe_app/authentication/presentation/Common/google/Repository/googleRepository.dart';
import 'package:recipe_app/authentication/presentation/cubit/signup_cubit.dart';
// import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'google_state.dart';

import 'package:google_sign_in/google_sign_in.dart';

// class GoogleCubit extends Cubit<GoogleState> {
//   final GoogleSignIn _googleSignIn;

//   GoogleCubit(this._googleSignIn) : super(GoogleInitial());

//   void signInWithGoogle() async {
//     try {
//       emit(GoogleLoading());
//       final googleUser = await _googleSignIn.signIn();
//       final googleGoogle = await googleUser.authentication//GooglGoogleeentication;
//       final credential = GoogleGoogleProvider.credential(
//         accessToken: googleGoogle.accessToken,
//         idToken: googleGoogle.idToken,
//       );
//       // TODO: Use the credential to sign in the user
//       emit(GoogleSuccess());
//     } catch (error) {
//       emit(GoogleError(error.toString()));
//     }
//   }
// }

import 'google_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final GoogleSignInRepository _repository;
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInCubit(this._repository):super(GoogleSignInInitial());

  Future<void> signIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth != null) {
        emit(GoogleSignInSuccess(googleAuth.accessToken!));
      } else {
        emit(GoogleSignInError('Authentication failed'));
      }
    } catch (e) {
      emit(GoogleSignInError(e.toString()));
    }
  }
}


  //________________________
//  final GoogleSignIn _googleSignIn;
  // final UserRepository _userRepository;
  // GoogleSignInCubit(this._userRepository) : super(GoogleSignInInitial());
  // Future<void> GoogleLogin() async {
  //   try {
  //     emit(GoogleSignInLoading());
  //     final token1 = await _userRepository.signInWithGoogle();
  //     emit(GoogleSignInSuccess(token1!));
  //   } //on DioError
  //   catch (error) {
  //     print(error);
  //     emit(GoogleSignInError(error.toString()));
  //   }
  // }


  
  // final GoogleSignIn _googleSignIn1 = GoogleSignIn(scopes: ['email']);

  // Future<void> signInWithGoogle() async {
  //   try {
  //     //  final GoogleSignInAccount?
  //     emit(GoogleSignInLoading());
  //     final googleUser = await _googleSignIn.signIn();
  //     // emit(GoogleSignInSuccess(googleUser));
  //   } catch (e) {
  //     emit(GoogleSignInError(e.toString()));
  //   }
  // }

  // Future<void> signOut() async {
  //   await _googleSignIn.disconnect();
  //   emit(GoogleSignInInitial());
  // }
//}
