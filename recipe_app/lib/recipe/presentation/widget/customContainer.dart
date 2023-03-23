import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:recipe_app/recipe/presentation/widget/constant.dart';
//import 'package:flutter_svg_provider/flutter_svg_provider.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  String image;
  String text1;
  CustomContainer({super.key, required this.image, required this.text1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 202.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: //SvgPicture.asset(image).
                  // AssetImage(image).
                  // Image.asset(image);
                  AssetImage(image),
              fit: BoxFit.cover)),
      child: Center(
          child: Text(
        text1,
        softWrap: false,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: "Metropolis"),
      )),
    );
  }
}
