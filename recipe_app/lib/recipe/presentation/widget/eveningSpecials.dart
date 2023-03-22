import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/recipe/data/model/eveningModel.dart';
import 'package:recipe_app/recipe/presentation/widget/imageConst.dart';
import 'constant.dart';

class EveningSpecial extends StatelessWidget {
  List<EveningModel> eveningModel = [
    EveningModel(
        id: 0,
        name: "Desserts Corner ",
        image:
            image19, //'images/image19.jpg', //Image.asset('images/image19.jpg'),
        number: '5 Recipes'),

    //icon: Icon(Icons.ad)

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
  EveningSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      //width: 120,
      //scolor: Colors.yellow,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: eveningModel.length, //5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 120.h,
                  width: 120.w,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                    borderRadius: BorderRadius.circular(8),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 1.5),
                          offset: Offset(3, 6),
                          spreadRadius: 2,
                          blurRadius: 8)
                    ],
                    image: DecorationImage(
                        image: AssetImage(
                          eveningModel[index].image.toString(),
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    //"hello",
                    eveningModel[index].name,
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
                    eveningModel[index].number,
                    style: TextStyle(
                        color: numberColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Metropolis"),
                  ),
                ),
              ],
              // ),
              //child: Text("Hello"),
            );
          }),
    );

    //_________________________
    // return Container(
    //   height: 190.h, // MediaQuery.of(context).size.height * 0.25,
    //   //color: Colors.orange,
    //   child: ListView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: eveningModel.length, //foRYoumodel
    //       //.length, //model!.length, //forYoumodel,//2, //data.length,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Padding(
    //           padding: const EdgeInsets.only(right: 16),
    //           child: Column(
    //             children: [
    //               Container(
    //                   width: 120.w,
    //                   height: 120.h,
    //                   // margin: EdgeInsets.only(top: 2, left: 12),
    //                   decoration: BoxDecoration(

    //                       // color: Colors.blue,
    //                       borderRadius: BorderRadius.circular(8),
    //                       // ignore: prefer_const_literals_to_create_immutables
    //                       boxShadow: [
    //                         const BoxShadow(
    //                           color: Color.fromRGBO(0, 0, 0, 0.15),
    //                         ),
    //                       ]
    //                       // image: Im
    //                       ),
    //                   child: Image.asset(
    //                     eveningModel[index].image.toString(),
    //                     //"images/image5.svg",
    //                     fit: BoxFit.cover,
    //                   )),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 16),
    //                 child: Text(
    //                   //"hello",
    //                   eveningModel[index].name,
    //                   style: TextStyle(
    //                       color: foodColor,
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w600,
    //                       fontFamily: "Metropolis"),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 16),
    //                 child: Text(
    //                   eveningModel[index].number,
    //                   style: TextStyle(
    //                       color: numberColor,
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.w400,
    //                       fontFamily: "Metropolis"),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         );
    //       }),
    // );
  }
}
