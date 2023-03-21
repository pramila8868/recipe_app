import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/recipe/presentation/widget/breakFastFood.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/customContainer.dart';
import 'package:recipe_app/recipe/presentation/widget/eveningSpecials.dart';
import 'package:recipe_app/recipe/presentation/widget/foodRecipe.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'package:recipe_app/recipe/presentation/widget/justForYou.dart';
import 'package:recipe_app/recipe/presentation/widget/recipeListBar.dart';
import 'package:recipe_app/recipe/presentation/widget/tabBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/specialList.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 26,
            ),
            TabBarPage(),
            // ignore: prefer_const_constructors

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Find ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontFamily: "Metropolis",
                        ),
                      ),
                      Text(
                        "best recipes",
                        style: TextStyle(
                          color: recipeColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontFamily: "Metropolis",
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "for Cooking ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  // GridView.builder(
                  //   itemCount: 2, //images.length,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       crossAxisSpacing: 4.0,
                  //       mainAxisSpacing: 4.0),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Text("Hello");
                  //     //Image.network(images[index]);
                  //   },
                  // )
                ],
              ),
            ),

            const SizedBox(
              height: 28,
            ),

            FoodRecipe(),
            // Padding(
            //   padding: const EdgeInsets.only(left: 21),
            //   child: Container(
            //       height: 200,
            //       width: double.infinity,
            //       color: Colors.pink,
            //       padding: const EdgeInsets.all(12.0),
            //       child: GridView.builder(
            //         itemCount: 2, //images.length,
            //         gridDelegate:
            //             const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 // crossAxisSpacing: 4.0,
            //                 mainAxisSpacing: 4.0),
            //         itemBuilder: (BuildContext context, int index) {
            //           return Container(
            //               height: 20,
            //               // height: 96.h,
            //               width: 150.w,
            //               color: Colors.white,
            //               child: Text("Hello")); //Image.network(images[index]);
            //         },
            //       )),
            // ),
            //   ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 16.h,
              color: backgroundColor,
            ),
            const RecipeListBar(),
            SizedBox(
              height: 28.h,
            ),
            Container(
              height: 16.h,
              color: backgroundColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  const Text(
                    "Breakfast Time",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  BreakFast(),
                  SizedBox(
                    height: 40.h,
                  ),
                  const Text(
                    "Evening Specials",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: "Metropolis",
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  EveningSpecial(),
                ],
              ),
            ),
            SizedBox(height: 48.h),
            CustomContainer(image: image16, text1: "Apple Pie"),
            SizedBox(height: 16.h),
            CustomContainer(image: image15, text1: "IceCream"),
            SizedBox(height: 16.h),
            CustomContainer(image: image8, text1: "Cup Cakes"),
            SizedBox(height: 56.h),
            Container(height: 16.h, color: backgroundColor),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    "Specials",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,

                      // fontFamily:
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),

                  // child: Wrap(
                  //   direction: Axis.horizontal,
                  //   // child: Row(
                  //   children: [
                  //     SpecialList(
                  //       specialList: 'Salads',
                  //     ),

                  //     // SpecialList(
                  //     //   specialList: 'Salads',
                  //     // ),
                  //     // SpecialList(
                  //     //   specialList: 'Salads',
                  //     // )
                  //     SizedBox(
                  //       height: 56.h,
                  //     ),
                  //   ],
                  // ),

                  Wrap(
                    //  crossAxisAlignment: WrapCrossAlignment
                    //    .start, //WrapCrossAxisAlignment.start,
                    direction: Axis.horizontal,
                    //  alignment: WrapAlignment.start,
                    //runAlignment: WrapAlignment.start,
                    spacing: 12,
                    runSpacing: 20,
                    children: [
                      SpecialList(specialList: "Salads"),
                      SpecialList(specialList: "Bread"),
                      SpecialList(specialList: "Pasta"),
                      SpecialList(specialList: "Milk"),
                      SpecialList(specialList: "Tomato"),
                      SpecialList(specialList: "Potato"),
                      SpecialList(specialList: "Italian"),
                      SpecialList(specialList: "French"),
                      SpecialList(specialList: "Japanese"),
                    ],
                  )
                  // ),
                ],
              ),
            ),

            SizedBox(
              height: 56.h,
            ),
            Container(
              height: 124.h,
              width: 375.w,
              color: backgroundColor,
              child: Center(
                child: Text(
                  "Ad AREA",
                  style: TextStyle(
                      color: textColor,
                      fontFamily: "Metropolis",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      )),
    );
  }
}
