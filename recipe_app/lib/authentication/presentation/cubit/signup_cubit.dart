import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/HomePage/Presentation/Page/homeScreen.dart';

import 'package:recipe_app/authentication/data/Model/model.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';

import '../../data/Repository/repository.dart';

//import 'package:recipe_app/Presentation/authentication/widget/signUp/repository/repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final PostRepository _repository;
  SignupCubit(this._repository) : super(SignupInitial());

  Future<void> PostUser(String name, String phnumber, String email,
      String password, String invitationCode) async {
    emit(SignupLoading());
    try {
      UserDetail response = await _repository.createUser(
        name,
        phnumber,
        email,
        password,
        invitationCode,
      );
      emit(SignupLoaded(response));
    } on DioError catch (e) {
      print("Hello");
      print(e);
      emit(SignupError(e.toString()));
    }
  }
}
