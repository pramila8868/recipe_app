import 'package:bloc/bloc.dart';
import 'package:recipe_app/authentication/domain/repository/googleRepository.dart';
//import 'package:recipe_app/authentication/presentation/cubit/signup_cubit.dart';
// import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'googleState.dart';

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

import 'googleState.dart';

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

