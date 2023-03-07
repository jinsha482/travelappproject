import 'dart:ui';

import 'package:flutter/material.dart';

class click extends StatelessWidget {
  const click({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(child: Column(children: [Stack(children:[ Container(width:double.infinity,height: 300,decoration: BoxDecoration(image:DecorationImage(image: AssetImage('assets/images/allepey.jpg'),fit: BoxFit.cover))),Positioned(top:240,child: Container(width:392,height:400,decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(40)),child:Container(margin:EdgeInsets.only(top:20,left:150),child:Text('Allepey',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),))))]),SizedBox(height:40),Container(margin:EdgeInsets.only(left:20,right: 20),child: Text('Allepey is a city and a municipality in Kerala with an urban population of 174,164 and ranks third among the districts in literacy rate in the state.',style: TextStyle(color:Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),))],),),
    );
  }
}
