import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';


part 'splash_state.dart';

//enum SplashState{loading,loaded}
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.loading);

  void loadsplash() {
    // Future.delayed(Duration(seconds: 9));
    Timer(const Duration(seconds: 3), () {
      emit(SplashState.loaded);
    });
  }
}
