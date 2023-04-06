import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(68, 58, 57, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Add to Groceries",
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: "Red Hat Display"),
        ),
      ),
    );
  }
}
