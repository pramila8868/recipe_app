// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:recipe_app/recipe/data/model/JustForYouModel.dart';
import 'package:recipe_app/recipe/data/model/foodRecipe.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';

import 'constant.dart';

class FoodRecipe extends StatelessWidget {
  List<FoodRecipeModel> recipemodel = [
    FoodRecipeModel(
        id: 0,
        text: "Chicken ",
        image: image12), //SvgPicture.asset('images/image6.svg')),
    //icon: Icon(Icons.ad)

    FoodRecipeModel(
      id: 1,
      text: "Noodles",
      image: image13,
    ), //SvgPicture.asset('images/image6.svg')
    //icon: Icon(Icons.ad)
    //),

    FoodRecipeModel(
      id: 1,
      text: "Bread",
      image: image12,
    ),
    FoodRecipeModel(
      id: 1,
      text: "For Kids",
      image: image13,
    ),
  ];
  //final List<ForYouModel> model;
  FoodRecipe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: Row(
        children: [
          Container(
            height: 96.h,
            width: 150.w,
            // margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                  image: AssetImage(
                    "images/image12.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 14),
                child: Text(
                  "Chicken",
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
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 96.h,
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    image: AssetImage(
                      "images/image13.png",
                    ),
                    fit: BoxFit.cover)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 14),
                child: Text(
                  "Noodles",
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
        ],
      ),
    );
  }
}

class FoodRecipe1 extends StatelessWidget {
  //final List<ForYouModel> model;
  const FoodRecipe1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: Row(
        children: [
          Container(
            height: 96.h,
            width: 150.w,
            // margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                  image: AssetImage(
                    "images/image12.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 14),
                child: Text(
                  "Bread",
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
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 96.h,
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    image: AssetImage(
                      "images/image13.png",
                    ),
                    fit: BoxFit.cover)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 14),
                child: Text(
                  "For Kids",
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
        ],
      ),
    );
    
  }
}
