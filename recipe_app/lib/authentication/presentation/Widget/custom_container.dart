import 'package:flutter/material.dart';


import 'constant.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  String image;
  
  CustomContainer({super.key, required this.image,});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  //color: Colors.grey,
                  blurRadius: 9,
                  spreadRadius: 4)
            ]),
        child: Image.asset(image));
  }
}
