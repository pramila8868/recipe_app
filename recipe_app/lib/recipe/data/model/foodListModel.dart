import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodListModel {
  int? id;
  String text;
  String image;
  Icon icon1;

  FoodListModel({
    this.id,
    required this.icon1,
    required this.text,
    required this.image,
  });
}
