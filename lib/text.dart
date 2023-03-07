import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:travel_app/button.dart';

class apptext extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  apptext(
      {Key? key, this.size = 30, required this.text, this.color = Colors.black})
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
            text,
            style: TextStyle(
                color: color, fontSize: size, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(child: Center(child: buttons()))
      ]),
    ));
  }
}
