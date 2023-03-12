part of 'signup_cubit.dart';

@immutable
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
