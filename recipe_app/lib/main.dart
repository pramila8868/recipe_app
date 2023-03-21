import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/data/Model/model.dart';
import 'package:recipe_app/authentication/presentation/Common/Dio/cubit/Login_cubit.dart';
import 'package:recipe_app/authentication/presentation/Common/LoginRepostory/repository.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/storageService.dart';

import 'package:recipe_app/authentication/presentation/Common/google/cubit/google_cubit.dart';
import 'package:recipe_app/authentication/presentation/Common/google/cubit/google_state.dart';
import 'package:recipe_app/authentication/presentation/page/signUp/signup_screen.dart';
import 'package:recipe_app/button.dart';
//import 'package:recipe_app/Presentation/authentication/widget/signUp/cubit/signup_cubit.dart';
//import 'package:recipe_app/Presentation/authentication/widget/signUp/repository/repository.dart';
import 'package:recipe_app/onboarding/presentation/bloc/onboarding/onbardingCubit.dart';
import 'package:recipe_app/onboarding/presentation/page/onboarding_screen1.dart';
import 'package:recipe_app/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/data/checkbox/cubit/checkbox_cubit.dart';
import 'package:recipe_app/data/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/data/Repository/repository.dart';
import 'authentication/presentation/Common/google/Repository/googleRepository.dart';
import 'authentication/presentation/cubit/signup_cubit.dart';
import 'authentication/presentation/page/loginScreen/loginscreen.dart';
import 'recipe/presentation/screens/buttonNAvigation.dart';
import 'recipe/presentation/screens/buttonNavogationBar.dart';
import 'recipe/presentation/screens/recipeScreen.dart';
import 'recipe/presentation/widget/cubit/tabbar_cubit.dart';
import 'recipe/presentation/widget/foodRecipe.dart';
import 'recipe/presentation/widget/tabBar.dart';

//import 'Presentation/authentication/widget/Presentation/cubit/signup_cubit.dart';
//import 'Presentation/authentication/widget/Presentation/repository/repository.dart';

void main() {
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
              BlocProvider(create: (context) => SignupCubit(PostRepository())),
              // BlocProvider(
              //     create: (context) => GoogleSignInCubit(
              //         GoogleSignInRepository()
              //             as GoogleSignInState)), //UserRepository())),
              BlocProvider(
                  create: (context) => LoginCubit(LoginPostRepository())),
              BlocProvider(create: (context) => TabBarCubit()),
              BlocProvider(
                  create: (context) =>
                      GoogleSignInCubit(GoogleSignInRepository())),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: //FoodRecipe(),

                  // RecipeScreen()
                  CenteredBottomNavigation(),
              // BottomNavigation()
              // const MyWidget(),
              // FutureBuilder<String?>(
              //   future: authService.getToken(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return SplashScreen();
              //     } else {
              //       return snapshot.hasData
              //           ? const LoginScreen()
              //           : const OnBoarding1(); //LoginPage(authService: authService);
              //     }
              //   },
              // ),
              // TabBarPage(),
              // const SplashScreen()
              // home:
              //  OnBoarding1()
              // OnBoardingScreen1(),
              //const LoginScreen()
              //  SignUpScreen(),
            ),
          );
          //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
          //    );
        });
  }
}
