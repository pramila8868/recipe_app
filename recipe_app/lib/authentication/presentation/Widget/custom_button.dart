import 'package:flutter/material.dart';

import 'constant.dart';

class CustomButton extends StatelessWidget {
  String text;
  CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 315,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
