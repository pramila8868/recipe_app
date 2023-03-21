import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:recipe_app/HomePage/Presentation/Page/homeScreen.dart';
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';
import 'package:recipe_app/authentication/data/Model/model.dart';
import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/login_state.dart';
import 'package:recipe_app/authentication/presentation/Common/LoginRepostory/repository.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';

//import 'package:recipe_app/Presentation/authentication/widget/signUp/repository/repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginPostRepository _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> LogIn(
    String name,
    String password,
  ) async {
    emit(LoginLoading());
    try {
      LoginDetail response = await _repository.logInUser(name, password
          //  name,
          //  phnumber,
          //    email,
          //   password,
          // invitationCode,
          );
      emit(LoginLoaded(response));
    } on DioError catch (e) {
      print(e);
      //String errorMsg = e.response!['message']; //e.response!.data["message"];
      print("Hello");
      //print(errorMsg);
      // String  error= e.message.
      // print(MessageCodec);
      emit(LoginError(e.toString()));
    }
  }
}
