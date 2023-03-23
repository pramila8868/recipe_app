import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import '../../../authentication/presentation/widget/constant.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              Flushbar(
                maxWidth: 344,
                //margin: EdgeInsets.all(12),
                padding: const EdgeInsets.only(top: 13, bottom: 13, left: 16),
                borderRadius: BorderRadius.circular(8),
                flushbarPosition: FlushbarPosition.TOP,
                // reverseAnimationCurve: Curves.linear,
                backgroundColor: flushColor,

                icon: SvgPicture.asset('images/flushbar.svg'),
                //.asset(name)//const Icon(Icons.message_rounded),
                //title: "Error",
                //titleColor: Colors.black,
                //titleSize: 24,
                //message: "Message", // state.message,
                messageColor: Colors.white,
                messageSize: 14,
                messageText: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Message",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
                duration: const Duration(seconds: 15),
                //  title:"Error",
              ).show(context);
              const Text("Hello");
            },
            child: const Text("Button"),
          )
        ],
      ),
    ));
  }
}
