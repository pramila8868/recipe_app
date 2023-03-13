import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/onboarding/presentation/page/onboarding_screen1.dart';
import 'package:recipe_app/data/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state == SplashState.loaded) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OnBoarding1()));
              // Navigator.of(context).pushNamed(const OnBoarding1());
              // } else {
              //   return Container();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 1.05.h,
                  width: double.infinity,
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [
                  //       Color.fromARGB(242, 0, 0, 0),
                  //       // Colors.red
                  //       Color.fromARGB(230, 255, 255, 255)
                  //     ],
                  //         // begin: Alignment.bottomCenter,
                  //         // stops: [0.9, 0.2]
                  //         begin: Alignment.bottomCenter,
                  //         end: Alignment.topCenter)),
                  child: Opacity(
                    opacity: 1,
                    child: Image.asset(
                      "images/image1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 52.sp),
                      Image.asset("images/Group 11.png"),
                      SizedBox(
                        height: 16.sp,
                      ),
                      const Text(
                        "100+ Preminum Recipe",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "tyuuoo"),
                      ),
                      const SizedBox(
                        height: 323,
                      ),
                      // const Expanded(
                      //     child: SizedBox(
                      //   height: 432,
                      // )),
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
                      const SizedBox(
                        height: 20,
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
              ])
            ],
          ),
        ),
      ),
    );
  }
}
