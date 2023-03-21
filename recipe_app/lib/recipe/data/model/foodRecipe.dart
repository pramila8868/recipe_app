import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodRecipeModel {
  int? id;
  String text;
  String image;

  FoodRecipeModel({
    this.id,
    required this.text,
    required this.image,
  });
}