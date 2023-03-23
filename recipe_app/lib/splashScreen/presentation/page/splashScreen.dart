
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/authentication/presentation/Common/Storage/storageService.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/onboarding/presentation/page/onboarding_screen1.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
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
              final token = await storage.getToken();
              if (token != null) {
                // ignore: use_build_context_synchronously
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                // );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route route) => false);
              } else {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoarding1()),
                );
              }
              
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "images/image1.jpg",
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
    );
  }
}
