

//import 'package:recipe_app/authentication/data/Model/loginDetail.dart';

import 'package:recipe_app/authentication/data/Model/loginDetail.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  //final List<UserDetail> userdetail;
  //final UserDetail userDetail;
  // final UserDetail userdetail;
  final LoginDetail loginDetail;
  
  LoginLoaded(this.loginDetail);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}
