import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:travel_app/welcomebutton.dart';

class text_one extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final String texts;

  text_one(
      {Key? key,
      this.size = 30,
      required this.text,
      required this.texts,
      this.color = Colors.black})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: 350,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(top: 420, left: 95),
              child: Text(text,
                  style: TextStyle(
                      color: color,
                      fontSize: size,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(texts,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 16)),
            SizedBox(
              height: 20,
            ),
            Container(child: Center(child: button()))
          ])),
    );
  }
}
