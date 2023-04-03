import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  List<EveningModel> eveningModel = [
    EveningModel(
        id: 0,
        name: "Desserts Corner",
        image:
            image19, //'images/image19.jpg', //Image.asset('images/image19.jpg'),
        number: '5 Recipes'),

    //icon:  Icon(Icons.ad)

    EveningModel(
      id: 1, name: "Cake Delivery",
      image: image17, //Image.asset('images/image17.svg'),
      number: '15 Recipes',

      //icon: Icon(Icons.ad)
    ),
    EveningModel(
      id: 2, name: "Yum Snacks",
      image: image18, //Image.asset('images/image18.svg'),
      number: '5 Recipes',

      //icon: Icon(Icons.ad)
    ),
  ];
  BreakFast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        recipeList(breakfastModel),
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
        recipeList(eveningModel)
      ],
    );
  }

  Widget recipeList(List data) {
    return SizedBox(
      height: 190.h,
      //width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: data.length, //foRYoumodel
          //.length, //model!.length, //forYoumodel,//2, //data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(118, 255, 255, 255),
                        Color.fromARGB(112, 0, 0, 0)
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.darken,
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      // boxShadow: [
                      //   const BoxShadow(
                      //     color: Color.fromRGBO(0, 0, 0, 1.5),
                      //     offset: Offset(3, 6),
                      //     //spreadRadius: 2,
                      //     blurRadius: 8,
                      //   )
                      // ],
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          // image: //SvgPicture.asset(image12),
                          image: AssetImage(data[index].image.toString()
                              //breakfastModel[index].image.toString()
                              //image
                              //    image21
                              //   icon1
                              //  breakfastModel[index].image.toString(),
                              ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: SizedBox(
                      width: 120,
                      // width: double.infinity,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // text,
                            //  "Egg",
                            data[index].name,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: foodColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Metropolis"),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            // "% recipe",
                            // recipeNumber,
                            data[index].number,
                            style: TextStyle(
                                color: numberColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Metropolis"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
