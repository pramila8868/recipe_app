// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/recipe/data/model/foodListModel.dart';

import 'constant.dart';
import 'imageConst.dart';

class FoodListPage extends StatelessWidget {
  List<FoodListModel> foodListmodel = [
    FoodListModel(
        id: 0,
        text: "Spicy Arrabiata Pasta",
        image: image23,
        icon1: Icon(Icons.favorite)), //SvgPicture.asset('images/image6.svg')),
    //icon: Icon(Icons.ad)

    FoodListModel(
        id: 1,
        text: "Spicy Arrabiata Pasta",
        image: image24, //SvgPicture.asset('images/image6.svg')
        icon1: Icon(Icons.favorite)),
  ];
  //final List<ForYouModel> model;
  FoodListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: foodListmodel
            .length, //model!.length, //forYoumodel,//2, //data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8
                // left: 16, //right: 20,
                //top: 20,
                //bottom: 20
                ),
            child: Container(
              width: 248.w,
              height: 224.h,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                //color: Colors.amber,
                image: DecorationImage(
                  image: AssetImage(
                      foodListmodel[index].image), //("images/image6.png"),

                  // //    image: SvgPicture.(
                  // //      foRYoumodel[index].image.toString(),
                  // // //     //   fit: BoxFit.contain,
                  // //    )
                  fit: BoxFit.cover,
                ),
              ),

              // margin: const EdgeInsets.all(8),
              child: //Padding(
                  // padding: const EdgeInsets.only(left: 8, top: 176),
                  // child:
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 17,
                      left: 211,
                    ),
                    //child: Icon(Icons.save),
                    // child: SvgPicture.asset(
                    //   icon5,
                    //   // color: Colors.red,
                    //   //   //color: Colors.red,
                    //   // ), //Image.asset("")

                    //   //Icon(
                    //   // AssetImage(ima).
                    //   //  //Icons.favorite,
                    // ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      foodListmodel[index].text,
                      style: TextStyle(
                          color: labelColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Metropolis"),
                    ),
                  ),
                ],
              ),
            ),
            // ),
          );
        });
  }
}