





abstract class GoogleSignInState {}

class GoogleSignInInitial extends GoogleSignInState {}

class GoogleSignInLoading extends GoogleSignInState {}

class GoogleSignInSuccess extends GoogleSignInState {
  String token;
  GoogleSignInSuccess(this.token);
  //final Goo
  //GoogleSignInSuccess(this.)
}

class GoogleSignInError extends GoogleSignInState {
  final String message;

  GoogleSignInError(this.message);
}
