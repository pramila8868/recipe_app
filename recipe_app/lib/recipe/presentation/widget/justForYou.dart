// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/recipe/data/model/JustForYouModel.dart';

import 'constant.dart';

// ignore: must_be_immutable
class JustForYou extends StatelessWidget {
  List<ForYouModel> foRYoumodel = [
    ForYouModel(id: 0, text: "Soup ", image: 'images/image25.jpg'),
    //icon: Icon(Icons.ad)

    ForYouModel(id: 1, text: "Cakes", image: 'images/image26.jpg')
    //icon: Icon(Icons.ad)
    //  ),
  ];
  //final List<ForYouModel> model;
  JustForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Container();
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: foRYoumodel
            .length, //model!.length, //forYoumodel,//2, //data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              // left: 16, //right: 20,
              //top: 20,
              //bottom: 20
            ),
            child: Center(
              child: Container(
                width: 220.w,
                height: 84.h,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      foRYoumodel[index].image,
                    ),
                    //  image: SvgPicture.(
                    //image: foRYoumodel[index].image.toString(),
                    // //     //   fit: BoxFit.contain,
                    //    )

                    fit: BoxFit.cover,
                  ),
                ),

                //margin: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      bottom: 4,
                    ),
                    child: Text(
                      foRYoumodel[index].text,
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
                ),
              ),
            ),
          );
        });
  }
}
