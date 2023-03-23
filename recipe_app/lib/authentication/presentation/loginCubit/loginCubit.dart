import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:recipe_app/authentication/presentation/loginCubit/loginState.dart';
import 'package:recipe_app/homePage/Presentation/Page/homeScreen.dart';
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';
import 'package:recipe_app/authentication/data/Model/model.dart';
import 'package:recipe_app/authentication/domain/repository/loginRepository.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';



class LoginCubit extends Cubit<LoginState> {
  final LoginPostRepository _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  // ignore: non_constant_identifier_names
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
