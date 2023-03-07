import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/buttonthree.dart';

class textofone extends StatelessWidget {
  double size;
  final String texts;
  final Color color;

  textofone(
      {Key? key,
      this.size = 30,
      required this.texts,
      this.color = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: 350,
      padding: EdgeInsets.only(top: 420),
      child: Column(children: [
        Center(
          child: Text(
            texts,
            style: TextStyle(
                fontSize: size, color: color, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(child: Center(child: buttonthree()))
      ]),
    ));
  }
}
