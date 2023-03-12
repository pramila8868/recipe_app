import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
//import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

//enum SplashState{loading,loaded}
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.loading);

  void loadsplash() {
    // Future.delayed(Duration(seconds: 9));
    Timer(const Duration(seconds: 6), () {
      emit(SplashState.loaded);
    });
  }
}
