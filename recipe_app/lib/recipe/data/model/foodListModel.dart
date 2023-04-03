// ignore: file_names
import 'package:flutter/material.dart';

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
