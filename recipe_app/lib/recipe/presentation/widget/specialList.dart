import 'package:flutter/material.dart';
import 'package:recipe_app/recipe/presentation/widget/constant.dart';

class SpecialList extends StatelessWidget {
  // String specialList;
  final List<String> list = [
    "Salads",
    "Bread",
    "Pasta",
    "Milk",
    "Tomato",
    "Potato",
    "Italian",
    "French",
    "Japanese ",
  ];
  SpecialList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 12, runSpacing: 20, children: [
      ...List.generate(list.length, (index) {
        return Container(
            //height: 42,
            decoration: BoxDecoration(
                color: specialListColor,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 9, bottom: 9),
              child: Text(
                list[index],
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ));
      }).toList()
    ]);
  }
}
