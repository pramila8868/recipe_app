import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredientsModel {
  int? id;
  String foodName;
  String image;
  String itemNumber;
  bool isChecked;
  IngredientsModel(
      {this.id,
      required this.foodName,
      required this.image,
      required this.isChecked,
      required this.itemNumber});
}
