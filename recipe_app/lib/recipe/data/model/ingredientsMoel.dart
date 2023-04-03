import 'package:flutter/widgets.dart';

class IngredientsModel {
  int? id;
  String foodName;
  String image;
  String itemNumber;
  IngredientsModel(
      {this.id,
      required this.foodName,
      required this.image,
      required this.itemNumber});
}

List<IngredientsModel> ingredientsModel = [
  IngredientsModel(
      foodName: "Peeled boiled egg", image: "", itemNumber: "6 pcs"),
  IngredientsModel(foodName: "Mayonnaise", image: "", itemNumber: "1/4cup"),
  IngredientsModel(foodName: "Lemon juice", image: "", itemNumber: "1tbsp"),
  IngredientsModel(foodName: "Yellow mustard", image: "", itemNumber: "1tbsp"),
  IngredientsModel(foodName: "Salt", image: "", itemNumber: "1/4tbsp"),
  IngredientsModel(foodName: "Pepper", image: "", itemNumber: "1/4 tbsp"),
  IngredientsModel(foodName: "chopped celery", image: "", itemNumber: "60g"),
  IngredientsModel(
      foodName: "slicedgreen onions", image: "", itemNumber: "18g"),
];
