import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/authentication/domain/repository/googleRepository.dart';
//import 'package:recipe_app/authentication/presentation/cubit/signup_cubit.dart';
// import 'package:meta/meta.dart';
import 'googleState.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
//  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;
  GoogleSignInCubit(this._userRepository) : super(GoogleSignInInitial());
  Future googleLogin(//String googleToken
      ) async {
    emit(GoogleSignInLoading());
    try {
    //  emit(GoogleSignInLoading());
      GoogleSignIn googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final token = googleUser.serverAuthCode;
      print(token);
      print(googleUser.serverAuthCode);
      print(googleUser);
      final token1 = await _userRepository.signInWithGoogle(
          // googleToken
          token.toString());
      print(token1);
      emit(GoogleSignInSuccess(token1.toString()));
      //  emit(GoogleSignInSuccess(token1.toString()));
    } on DioError catch (e) {
      print("Hello");
      emit(GoogleSignInError(e.toString()));
    }
  }

  dicontinue() async {
    googleSignIn.disconnect();
    await _storage.delete(key: 'token');
    print('disconnected');
  }
}
