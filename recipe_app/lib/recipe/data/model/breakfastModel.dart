import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreakfastModel {
  int? id;
  String name;
  String image;
  String number;

  BreakfastModel({
    this.id,
    required this.name,
    required this.image,
    required this.number
  });
}
