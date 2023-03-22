import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 150,
      color: Colors.amber,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              margin: EdgeInsets.all(10),
              child: Center(child: Text("Hello")),
            );
          }),
    ));
  }
}
