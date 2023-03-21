import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/recipe/data/model/breakfastModel.dart';
import 'package:recipe_app/recipe/data/model/eveningModel.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'constant.dart';

// ignore: must_be_immutable
class BreakFast extends StatelessWidget {
  List<BreakfastModel> breakfastModel = [
    BreakfastModel(
        id: 0,
        name: "Egg & Avocado ",
        image: image20, //SvgPicture.asset('images/image3.svg'),
        number: '5 Recipes'),

    //icon: Icon(Icons.ad)

    BreakfastModel(
      id: 1, name: "Tacos",
      image: image21, //SvgPicture.asset('images/image3.svg'),
      number: '5 Recipes',

      //icon: Icon(Icons.ad)
    ),
    BreakfastModel(
      id: 2, name: "Healthy Sandwiches",
      image: image22, //SvgPicture.asset('images/image3.svg'),
      number: '5 Recipes',

      //icon: Icon(Icons.ad)
    ),
  ];
  BreakFast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h, // MediaQuery.of(context).size.height * 0.25,
      //color: Colors.orange,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: breakfastModel.length, //foRYoumodel
          //.length, //model!.length, //forYoumodel,//2, //data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          //color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        breakfastModel[index].image.toString(),
                        //"images/image5.svg",
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      //"hello",
                      breakfastModel[index].name,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: foodColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Metropolis"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      breakfastModel[index].number,
                      style: TextStyle(
                          color: numberColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Metropolis"),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
