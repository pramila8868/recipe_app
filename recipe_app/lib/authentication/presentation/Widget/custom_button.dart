import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 316,
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
          SizedBox(
            width: 8.w,
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
