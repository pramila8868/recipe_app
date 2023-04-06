import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/Login_cubit.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/storageService.dart';
import 'package:recipe_app/authentication/presentation/cubit/googleCubit/googleCubit.dart';

import 'package:recipe_app/authentication/presentation/cubit/signUpCubit/signUpCubit.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/onboarding/presentation/bloc/onboarding/onbardingCubit.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/checkbox/cubit/checkboxCubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/domain/repository/SignUpRepository.dart';
import 'authentication/domain/repository/googleRepository.dart';
import 'authentication/domain/repository/loginRepository.dart';
import 'authentication/presentation/loginCubit/loginCubit.dart';
//import 'authentication/presentation/page/loginScreen/loginscreen.dart';
import 'authentication/presentation/page/loginScreen/loginscreen.dart';
import 'recipe/presentation/cubit/tabbar_cubit.dart';
import 'recipe/presentation/screens/buttonNavogationBar.dart';
import 'splashScreen/presentation/cubit/splash_cubit.dart';
import 'splashScreen/presentation/page/splashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StorageService authService = StorageService();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 823),
        builder: (context, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SplashCubit()
                    ..loadsplash(), //cascade notation.. chain multiple method on the same object,contun the same method chain,  return splashcubit itself instead loadsplashcall function on object
                  //   child: OnBoardingScreen() //const SplashScreen(),
                ),
                BlocProvider(create: (context) => OnbardingCubit()),
                BlocProvider(create: (context) => CheckboxCubit()),
                BlocProvider(
                    create: (context) => SignupCubit(PostRepository())),
                BlocProvider(
                    create: (context) => LoginCubit(LoginPostRepository())),
                BlocProvider(create: (context) => TabBarCubit()),
                BlocProvider(
                    create: (context) => GoogleSignInCubit(UserRepository())),
              ],
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: //const CenteredBottomNavigation(),

                      const SplashScreen()
                  // home:
                  // const LoginScreen()
                  //),
                  ));
        });
  }
}
