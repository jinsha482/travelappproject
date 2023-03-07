import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.white60,elevation: 5,
      content: Text(text,style: TextStyle(color: Colors.black54),),
    ),
  );
}
