//part of 'signup_cubit.dart';

//@immutable
import 'package:recipe_app/authentication/data/Model/mode.dart';


abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupLoaded extends SignupState {
  //final List<UserDetail> userdetail;
final UserDetail userdetail;
  SignupLoaded(this.userdetail);
}

class SignupError extends SignupState {
  final String message;
  SignupError(this.message);
}

