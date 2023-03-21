import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/authentication/presentation/Widget/constant.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

class SpecialList extends StatelessWidget {
  String specialList;
  SpecialList({super.key, required this.specialList});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 19, vertical: 6),
      //margin: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      height: 41.h,
      // width: MediaQuery.of(context).size.width,
      width: 98.w,
      decoration: BoxDecoration(
        color: specialListColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(
        specialList,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: "Metropolis",
            fontWeight: FontWeight.w400),
      )),
    );

    //________________________

    // return Wrap(
    //     //direction: Axis.horizontal,
    //     alignment: WrapAlignment.start,
    //     children: [
    //       ...List.generate(2, (index) {
    //         return InkWell(
    //             onTap: () {
    //               //  pageController.jumpToPage(index);
    //             },
    //             child: Container(
    //               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    //               margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
    //               //  height: 41.h,
    //               //  width: MediaQuery.of(context).size.width,
    //               // width: 98.w,
    //               decoration: BoxDecoration(
    //                 color: specialListColor,
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //               child: Center(
    //                   child: Text(
    //                 specialList,
    //                 style: const TextStyle(
    //                     fontSize: 16,
    //                     fontFamily: "Metropolis",
    //                     fontWeight: FontWeight.w400),
    //               )),
    //             ));
    //       })
    //     ]);

    //_____________________________________
    //List.generate(3, (index) => const Text("Hello"))
    //  return  List.generate(
    //   3,(index)=>
    //    child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    //     margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
    //     //  height: 41.h,
    //     //  width: MediaQuery.of(context).size.width,
    //     // width: 98.w,
    //     decoration: BoxDecoration(
    //       color: specialListColor,
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: Center(
    //         child: Text(
    //       specialList,
    //       style: const TextStyle(
    //           fontSize: 16,
    //           fontFamily: "Metropolis",
    //           fontWeight: FontWeight.w400),
    //     )),
    //      ),
    //  );

    //_____________----
  }
}
