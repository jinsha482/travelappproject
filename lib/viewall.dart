

import 'package:flutter/material.dart';
import 'package:travel_app/destination.dart';
import 'package:travel_app/destinations.dart';

class viewall extends StatefulWidget{
  @override
  State<viewall> createState() => _viewallState();
}

class _viewallState extends State<viewall> {
  @override
  Widget build (BuildContext context){
return Scaffold(appBar:AppBar(title:Icon(Icons.travel_explore,size:35,color: Colors.white,),centerTitle:true,backgroundColor: Colors.greenAccent,),body: SafeArea(child: Container(margin: EdgeInsets.only(top:40,left: 20),

                         child: Expanded(
                           child: SingleChildScrollView(scrollDirection: Axis.vertical,
                             child: Column(
                               children: [destinations(items[5]),SizedBox(height: 28),destinations(items[6]),SizedBox(height: 28,),destinations(items[7]),SizedBox(height: 28,),destinations(items[8]),SizedBox(height: 28,),destinations(items[9]),SizedBox(height: 28,),destinations(items[10]),SizedBox(height: 28,),destinations(items[11])
                                 ]
                             ),
                           ),
                         ),
                       )),);
  }
}