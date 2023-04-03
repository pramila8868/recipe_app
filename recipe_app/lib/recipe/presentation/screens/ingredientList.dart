import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (item, int) {
      return Row(
        children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Row(
                  children: const [
                    Text(
                      "foodName",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          fontFamily: "Metropolis"),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(right: 24.5),
                      child: Text(
                        "itemNumber",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            fontFamily: "Metropolis"),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );
    });
  }
}
