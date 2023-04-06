import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recipe_app/recipe/data/model/exploreModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatelessWidget {
  List<ExploreModel> exploreList = [
    ExploreModel(
        iconImage: 'images/explore1.svg',
        image: "images/image27.jpg",
        text: "Weight Loss"),
    ExploreModel(
        iconImage: "images/explore2.svg",
        image: "images/image28.jpg",
        text: "Heart-Friendly"),
    ExploreModel(
        iconImage: "images/explore3.svg",
        image: "images/image29.jpg",
        text: "Weekend"),
    ExploreModel(
        iconImage: "images/explore4.svg",
        image: "images/image30.jpg",
        text: "Mushroom"),
    ExploreModel(
        iconImage: "images/explore5.svg",
        image: "images/image31.jpg",
        text: "Smmothies"),
    ExploreModel(
        iconImage: "images/explore6.svg",
        image: "images/image32.jpg",
        text: "Fish"),
    ExploreModel(
        iconImage: "images/explore8.svg",
        image: "images/image33.jpg",
        text: "Chowmin"),
  ];
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: exploreList.length, //images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //crossAxisSpacing: 1.0, //mainAxisSpacing: 1.0
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(exploreList[index].image),
                  fit: BoxFit.cover)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                height: 56,
                width: 56,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(7, 98, 103, 1),
                    shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    exploreList[index].iconImage,
                    height: 29.h,
                    width: 29.w,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              exploreList[index].text.toString(),
              style: const TextStyle(
                  fontFamily: "Metropolis",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(251, 251, 250, 1)),
            ),
          ]),
          // child:
        ); // Image.asset() //Image.network(images[index]);
      },
    );
  }
}

// //  GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             _isChecked = !_isChecked;
//                                           });
//                                         },
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 10, right: 46),
//                                           child: Container(
//                                             width: 24.0,
//                                             height: 24.0,
//                                             decoration: BoxDecoration(
//                                               color: Colors.red,
//                                               borderRadius:
//                                                   BorderRadius.circular(4.0),
//                                               border: Border.all(
//                                                 width: 2.0,
//                                                 color: _isChecked
//                                                     ? Colors.white
//                                                     : Colors.grey.shade400,
//                                               ),
//                                             ),
//                                             child: _isChecked
//                                                 ? const Icon(
//                                                     Icons.check,
//                                                     size: 16.0,
//                                                     color: Colors.red,
//                                                   )
//                                                 : null,
//                                           ),
//                                         ),
//                                       )

//bool _isChecked = false;