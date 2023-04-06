import 'package:flutter/material.dart';
import 'package:recipe_app/recipe/presentation/widget/breakFastFood.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/customImageContainer.dart';
import 'package:recipe_app/recipe/presentation/widget/justForYou.dart';
import 'package:recipe_app/recipe/presentation/widget/recipeListBar.dart';
import 'package:recipe_app/recipe/presentation/widget/tabBar.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/specialList.dart';

class Recipe extends StatelessWidget {
  const Recipe({super.key});

  @override
  Widget build(BuildContext context) {
    return //Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        // children: [
        // const SizedBox(
        //   height: 26,
        // ),
        SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           JustForYou(),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: RichText(
              //   textAlign: TextAlign.start,
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: "Metropolis",
                  ),
                  children: [
                    const TextSpan(
                      text: "Find ",
                    ),
                    TextSpan(
                      text: "best recipes\n",
                      style: TextStyle(color: recipeColor),
                    ),
                    const TextSpan(text: "for Cooking")
                  ]),
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            children: [
              recipe("Chicken", "images/image12.png"),
              recipe("Noodles", "images/image13.png")
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              recipe("Bread", "images/image12.png"),
              recipe("For kids", "images/image13.png")
            ],
          ),
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
              ],
            ),
          ),
          SizedBox(height: 48.h),
          CustomImageContainer(),

          SizedBox(height: 56.h),
          Container(height: 16.h, color: backgroundColor),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
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
                const SizedBox(
                  height: 28,
                ),

                SpecialList()

                // ),
              ],
            ),
          ),
          // List.generate()
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
    );
  }

  Widget recipe(String text, String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.4),
                Color.fromRGBO(0, 0, 0, 1)
              ] //Colors.white, Colors.black.withOpacity(0.1)],
              ).createShader(bounds);
        },
        blendMode: BlendMode.softLight,
        child: Container(
          height: 96.h,
          width: 150.w,
          // margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 14),
              child: Text(
                text,
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: labelColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Metropolis"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
