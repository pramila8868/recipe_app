// ignore_for_file: avoid_print

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:recipe_app/authentication/data/Model/mode.dart';

import 'package:recipe_app/authentication/domain/repository/SignUpRepository.dart';
import 'package:recipe_app/authentication/presentation/cubit/signUpCubit/signUpState.dart';

//import '../../data/Repository/repository.dart';

//import 'package:recipe_app/Presentation/authentication/widget/signUp/repository/repository.dart';

//part 'signup_state.dart';

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
      //DioError(requestOptions: )
      print(DioErrorType);
      print("Hello");
      print(e.error);
      print(e.message);
      print(e);
      //String errorMessage = e.response!.data['message'].toString();
      //print(errorMessage);
      emit(SignupError(e.toString()));
    }
  }
}
