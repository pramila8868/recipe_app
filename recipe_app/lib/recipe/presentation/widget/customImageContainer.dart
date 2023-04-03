import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/recipe/data/model/containerModel.dart';
// ignore: depend_on_referenced_packages
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

import 'imageConst.dart';
//import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// ignore: must_be_immutable
class CustomImageContainer extends StatelessWidget {
  List<ContainerModel> containerModel = [
    ContainerModel(id: 0, text: "Icecream ", image: image15),
    //icon: Icon(Icons.ad)

    ContainerModel(id: 1, text: "Cup Cakes", image: image8),
    ContainerModel(id: 2, text: "Apple Pie", image: 'images/pie.jpg'),
    //icon: Icon(Icons.ad)
    //  ),
  ];

  CustomImageContainer({super.key});
  //final List<ForYouModel> model;

  @override
  Widget build(BuildContext context) {
    //return Container();
    return SizedBox(
      height: 645.h,
      //height: MediaQuery.of(context).size.height,
      width: double.infinity,
      // color: Colors.blue,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          itemCount: containerModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 202.h,
              margin: const EdgeInsets.only(bottom: 16),
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(
                    containerModel[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              child: Center(
                child: Text(
                  containerModel[index].text,
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: labelColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Metropolis"),
                ),
              ),
            );
          }),
    );
  }
}
