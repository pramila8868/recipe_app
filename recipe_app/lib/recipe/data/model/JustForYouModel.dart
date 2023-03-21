import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForYouModel {
  int? id;
  String text;
  String image;

  ForYouModel({
    this.id,
    required this.text,
    required this.image,
  });
}

// List<ForYouModel> foRYoumodel = [
//   ForYouModel(id: 0, text: "Soup ", icon: Icon(Icons.money_outlined)),
//   //icon: Icon(Icons.ad)

//   ForYouModel(
//     id: 1,
//     text: "Cakes", icon: Icon(Icons.document_scanner_outlined),
//     //icon: Icon(Icons.ad)
//   ),
 
  
// ];
