//import 'package:recipe_app/authentication/data/Model/loginDetail.dart';

import 'package:recipe_app/authentication/data/Model/googleModel.dart';
import 'package:recipe_app/authentication/data/Model/loginDetail.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  //final List<UserDetail> userdetail;
  //final UserDetail userDetail;
  // final UserDetail userdetail;
  final GoogleModel responseModel;
  //final LoginDetail loginDetail;

  LoginLoaded( this.responseModel//this.loginDetail
  );
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
