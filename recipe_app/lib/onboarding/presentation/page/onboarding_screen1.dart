import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/authentication/presentation/page/loginScreen/loginscreen.dart';
import 'package:recipe_app/onboarding/model/onboarding.dart';
import 'package:recipe_app/onboarding/presentation/bloc/onboarding/onbardingCubit.dart';
import 'package:recipe_app/splash_screen/const.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({
    super.key,
    //required this.onboardingList,
  });

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  //final PageController pageController = PageController(initialPage: 0);
  final PageController pageController = PageController();

  //List<Onboarding> onboardingList;
  List<Onboarding> onboarding = [
    Onboarding(id: 0, image1: image1, image2: image2, text: onboardingtext1),
    Onboarding(id: 1, image1: image1, image2: image3, text: onboardingtext2),
    Onboarding(id: 2, image1: image1, image2: image4, text: onboardingtext3),
  ];
  //int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: false,
      child: BlocBuilder<OnbardingCubit, OnbardingState>(
        builder: (context, state) {
          if (state is OnboardingLoaded) {
            return (
                //   body:
                //child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //   BlocBuilder<OnboardingCubit, int>(builder: (context, state) {
                  //   return
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.75, //* 0.75, //* 0.87.h,
                    // color: Colors.pink,
                    child: PageView.builder(
                      controller: pageController,

                      onPageChanged: (value) async {
                        print(7878);
                        await BlocProvider.of<OnbardingCubit>(context)
                            .updatePageIndex(value);
                        //context.read<OnboardingCubit>().updatePage(value);
                      },
                      //   onPageChanged:pageController.initialPage.toString(),
                      itemCount: onboarding.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 64.h,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, right: 13),
                                child: SvgPicture.asset(
                                    onboarding[index].image1.toString()),
                              ), // Image.asset("images/logo1.png")),
                              Expanded(
                                child: SizedBox(
                                  height: 112.h,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: double.infinity,
                                // color: Colors.red,
                                child: SvgPicture.asset(
                                  onboarding[index].image2.toString(),
                                  fit: BoxFit.contain,
                                  // Boxf
                                  // fit: BoxFit.f,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 65.h,
                                ),
                              ),
                              Text(
                                onboarding[index].text.toString(),
                                // "Plan you weekly meals\n Save your Favourites",
                                style: const TextStyle(
                                    fontFamily: "Metropolis",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28),
                                textAlign: TextAlign.center,
                              ),
                            ]);
                      },
                      // );
                      // }
                    ),
                  ),

                  SizedBox(
                    height: 46.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 124),
                          child: Row(children: [
                            ...List.generate(onboarding.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(6.66),
                                child: InkWell(
                                  onTap: () {
                                    pageController.jumpToPage(index);
                                  },
                                  child: Container(
                                    height: 5.h,
                                    //  MediaQuery.of(context).size.height * 0.01,
                                    width: 37.56.w,
                                    // MediaQuery.of(context).size.width * 0.124.w,
                                    // margin: EdgeInsets.only(left: 70, right: 70),
                                    decoration: BoxDecoration(
                                      color: state.activePageIndex == index
                                          ? Colors.black
                                          : Colors.grey,
                                      //   state == index ? Colors.black : Colors.grey,
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              );
                            }).toList()
                          ]),
                        ),

                        SizedBox(
                          height: 52.h,
                        ),
                        //  Padding(
                        //  padding: const EdgeInsets.only(right: 38),
                        //child:
                        state.activePageIndex < 2
                            ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 232,
                                ),
                                child: Container(
                                  //   margin: EdgeInsets.only(left: ),
                                  height: 42.h,
                                  width: 105.w,

                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(237, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: MaterialButton(
                                      onPressed: () {
                                        state.activePageIndex > 1
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()))
                                            : pageController.jumpToPage(2);
                                      },
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          const Center(
                                            child: Text(
                                              // "SKIP",
                                              // ignore: prefer_is_empty
                                              // onboarding.length > 1 ? "SKIP" : "NEXT",
                                              //   state.activePageIndex < 2
                                              //  ?
                                              "SKIP",
                                              //: "GET STARTED",
                                              //> 2 ? "SKIP" : "NEXT",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: "Metropolis",
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          //  Visibility(
                                          //   visible: state.activePageIndex < 2,
                                          //child:
                                          const Icon(
                                            //state.activePageIndex<2?
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            // ),
                                          ),
                                        ],
                                      )),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 179, right: 38),
                                child: Container(
                                  //margin: EdgeInsets.only(left: 200),
                                  height: 42.h,
                                  // width: 128.w,
                                  // width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(237, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));

                                        // : pageController.jumpToPage(2);
                                      },
                                      child: const Center(
                                        child: Text(
                                          "GET STARTED",
                                          //  textAlign: TextAlign.center,
                                          //> 2 ? "SKIP" : "NEXT",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: "Metropolis",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                        //),
                        // Container(
                        //   height: 33.3.h,
                        //   //  color: Colors.amber,
                        // )
                        // ),
                        // //  if (onboarding.length >= 2) ?
                      ],
                    ),
                  )
                ]));
          } else {
            return Container();
          }
        },
      ),
    ));
  }
}
