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
    return Container(
      height: 300,
      // color: Colors.green,
      padding: EdgeInsets.only(left: 21, right: 42),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          //shrinkWrap: true,
          itemCount: recipemodel.length, //more.length,
          //scrollDirection: VerticalDirection,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 8.0,
            // childAspectRatio: 1
          ),
          itemBuilder: (context, index) {
            return
                // child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: payment.length, //FoodCollection.length,
                //     //: Axis.horizontal,
                //     scrollDirection: Axis.vertical,
                //     // ignore: sort_child_properties_last, sized_box_for_whitespace
                //     itemBuilder: (context, index) =>
                Container(
              height: 70,
              width: 150.w,
              //  margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 22),

              //height: 36.h,
              // width: 150.w,
              //  width: MediaQuery.of(context).size.width * 0.04.w,

              //  height: 700,

              decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(
                      recipemodel[index].image,
                    ),
                    // scale: 10,
                    fit: BoxFit.cover,
                  )
                  // color: Colors.white,

                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey, offset: Offset(3, 6)
                  //)
                  // ]
                  ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    recipemodel[index].text,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      //fontFamily: "Metropolis"
                    ),
                  ),
                ),
              ),
            );
          }),
    );

    //
    //
    //
  }
}
