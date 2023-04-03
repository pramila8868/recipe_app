// ignore: file_names

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/loginStorageService.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/storageService.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/onboarding/presentation/page/onboarding_screen1.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/recipe/presentation/screens/buttonNavogationBar.dart';
import 'package:recipe_app/splashScreen/presentation/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) async {
            if (state == SplashState.loaded) {
              StorageService storage = StorageService();
              final isFirstLogin = await storage.getToken();
              print(' main screen token is$isFirstLogin');
              if (isFirstLogin != null) {
                LoginStorageService loginStorage = LoginStorageService();
                final accessToken =
                    await loginStorage.getLoginToken("accessToken");
                print(' sub screen token is$accessToken');
                if (accessToken != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              const CenteredBottomNavigation()),
                      (Route route) => false);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route route) => false);
                  //  }
                }

                // final token1 = loginStorage.getLoginToken();
                // print(' sub screen token is$token1');
                // if (token1 != null) {
                //   Navigator.of(context).pushAndRemoveUntil(
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               const CenteredBottomNavigation()),
                //       (Route route) => false);
                // } else {
                //   Navigator.of(context).pushAndRemoveUntil(
                //       MaterialPageRoute(
                //           builder: (context) => const LoginScreen()),
                //       (Route route) => false);
                //   //  }
                // }
              } else {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoarding1()),
                );
              }
            }

            //---------------------------------

            //     StorageService storage = StorageService();
            //     final token = await storage.getToken();
            //     print(' main screen token is$token');
            //     if (token != null) {
            //       Navigator.of(context).pushAndRemoveUntil(
            //           MaterialPageRoute(
            //               builder: (context) => const LoginScreen()),
            //           (Route route) => false);

            //       // LoginStorageService loginStorage = LoginStorageService();
            //       // final token1 = loginStorage.getLoginToken();
            //       // print(' sub screen token is$token1');
            //       // if (token1 != null) {
            //       //   Navigator.of(context).pushAndRemoveUntil(
            //       //       MaterialPageRoute(
            //       //           builder: (context) =>
            //       //               const CenteredBottomNavigation()),
            //       //       (Route route) => false);
            //       // } else {
            //       //   Navigator.of(context).pushAndRemoveUntil(
            //       //       MaterialPageRoute(
            //       //           builder: (context) => const LoginScreen()),
            //       //       (Route route) => false);
            //       //   //  }
            //       // }
            //     } else {
            //       // ignore: use_build_context_synchronously
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(builder: (context) => const OnBoarding1()),
            //       );
            //     }
          },
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.4),
                  Color.fromRGBO(0, 0, 0, 1),
                ],
                //  transform: Transform(transform: transform)
              ).createShader(
                bounds,
              );
            },
            blendMode: BlendMode.softLight,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/test.jpg"

                    ///image1.jpg",
                    ),
                fit: BoxFit.cover,
              )
                  // adjust the image to cover the whole area
                  ),
              child: Column(
                children: [
                  SizedBox(height: 52.h),
                  Image.asset("images/Group 11.png"),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Text(
                    "100+ Preminum Recipe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "tyuuoo"),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Text(
                    "Get",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  const Text(
                    "Cooking",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    "Simple way to find Tasty Recipe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 78.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
