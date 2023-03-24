import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant.dart';

//w=344
//h:48
//padding:16

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  int lengthLimitingTextInputFormatter;
  // MaxLengthEnforcement? maxlengthEnforcement;
  int? maxlength;
  bool autoNode;
  FocusNode? focusNode;
  TextInputType keyBoard;
  IconButton? icon1;
  bool obSecureText;
  AutovalidateMode ?autovalidarorMode;
  bool? enabled;
  String? initialvalue;
  final String? Function(String?) custvalidator;
  TextEditingController controller;
  String label;
  CustomTextField(
      {super.key,
      required this.lengthLimitingTextInputFormatter,
    //  this.maxlengthEnforcement,
      this.maxlength,
      required this.autoNode,
      this.focusNode,
      required this.keyBoard,
      required this.obSecureText,
      this.icon1,
      this.enabled,
      this.initialvalue,
      required this.label,
      required this.controller,
      required this.custvalidator,
       this.autovalidarorMode});

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   height: 55.h,
        //   width: 315.h,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(10),
        //       border: Border.all(color: textfieldColor, width: 1.5)),
        //   child:

        TextFormField(
      maxLength: maxlength,
      autofocus: autoNode,
      focusNode: focusNode,
      keyboardType: keyBoard,
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthLimitingTextInputFormatter)
      ],
    //  maxLengthEnforcement: maxlengthEnforcement,
      //    keyboardType: ,
      // keyboardType: TextInputType.name,
      validator: custvalidator,
      obscureText: obSecureText,

      //  validator: (value) {
      //  return 'hello';
      //  },
      //enabled: enabled,
      //  initialValue: initialvalue,
      autovalidateMode: autovalidarorMode,
      controller: controller,
      cursorColor: Colors.black,
      cursorHeight: 20,

      decoration: InputDecoration(

          // focusedErrorBorder: OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(12),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //  borderSide: BorderSide(color: textColor)
          ),
          // errorBorder: OutlineInputBorder(

          //   borderRadius: BorderRadius.circular(10),

          //  ),
          //  hoverColor: textfieldColor, // textfieldColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: textColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: textColor,
              )),
          label: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
          suffixIcon: icon1
          // suffixIcon: IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.visibility)) //InkWell( onTap:(){},child: icon1),
          ),

      // ),
    );
  }
}
