import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/loginpage.dart';

class buttons extends StatelessWidget {
  const buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => login(),
          ));
        },
        icon: Icon(
          Icons.arrow_right_alt_outlined,
          color: Colors.black,
        ),
        label: Text(
          'Get Started',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ));
  }
}
