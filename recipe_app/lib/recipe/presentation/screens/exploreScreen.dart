import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/recipe/data/model/exploreModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  List<ExploreModel> exploreList = [
    ExploreModel(
        icon1: Icon(Icons.abc),
        image: "images/image27.jpg",
        text: "Weight Loss"),
    ExploreModel(
        icon1: Icon(Icons.abc),
        image: "images/image28.jpg",
        text: "Heart-Friendly"),
    ExploreModel(
        icon1: Icon(Icons.abc), image: "images/image29.jpg", text: "Weekend"),
    ExploreModel(
        icon1: Icon(Icons.abc), image: "images/image30.jpg", text: "Mushroom"),
    ExploreModel(
        icon1: Icon(Icons.abc), image: "images/image31.jpg", text: "Smmothies"),
    ExploreModel(
        icon1: Icon(Icons.abc), image: "images/image32.jpg", text: "Fish"),
    ExploreModel(
        icon1: Icon(Icons.abc), image: "images/image33.jpg", text: "Chowmin"),
  ];
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.all(12.0),

        //   ),
        // (
        //     // padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
      itemCount: exploreList.length, //images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //crossAxisSpacing: 1.0, //mainAxisSpacing: 1.0
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 600,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(exploreList[index].image))),
          child: Column(children: [
            Container(child: Icon(exploreList[index].icon1.icon)),
            Text(exploreList[index].text.toString()),
          ]),
          // child:
        ); // Image.asset() //Image.network(images[index]);
      },
    ));
  }
}
