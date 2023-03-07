import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/click.dart';
import 'package:travel_app/destination.dart';
import 'package:travel_app/destinations.dart';
import 'package:travel_app/provider/provider.dart';
import 'package:travel_app/viewall.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

class starting extends StatefulWidget {
  const starting({Key? key}) : super(key: key);

  @override
  State<starting> createState() => _startingState();
}

class _startingState extends State<starting> {
  
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black.withOpacity(0.8),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(margin:EdgeInsets.only(left: 20,top:100),child: Text('Explore',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),SizedBox(height: 20),
                  SingleChildScrollView(scrollDirection:Axis.horizontal,child: Row(children: [Container(margin: EdgeInsets.only(left: 20),width: 130,height: 40,decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius:  BorderRadius.all(Radius.circular(20))),child: Center(child: Text('Resorts',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)),),Container(margin: EdgeInsets.only(left: 20),width: 130,height: 40,decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius:  BorderRadius.all(Radius.circular(20))),child: Center(child: Text('Destinations',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))),Container(margin: EdgeInsets.only(left: 20),width: 130,height: 40,decoration: BoxDecoration(color: Colors.white.withOpacity(0.8),borderRadius:  BorderRadius.all(Radius.circular(20))),child: Center(child: Text('Restaurants',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)))],),),SizedBox(height: 30,),
              // CarouselSlider(options: CarouselOptions(autoPlay: true,autoPlayInterval: Duration(seconds: 2),autoPlayAnimationDuration: Duration(milliseconds: 390),height: 250),
              //   items: [Container(margin: EdgeInsets.only(left:20),
                 
              //     decoration: BoxDecoration(
              //         color: Colors.grey,
              //         image: DecorationImage(
              //             image: AssetImage('assets/images/photo-1507608616759-54f48f0af0ee.jpeg',),
              //             fit: BoxFit.fill)),
              //   ),Container(margin: EdgeInsets.only(left:20),
                 
              //     decoration: BoxDecoration(
              //         color: Colors.grey,
              //         image: DecorationImage(
              //             image: AssetImage('assets/images/pxfuel.jpg'),
              //             fit: BoxFit.cover)),
              //   ),Container(margin: EdgeInsets.only(left:20),
                 
              //     decoration: BoxDecoration(
              //         color: Colors.grey,
              //         image: DecorationImage(
              //             image: AssetImage('assets/images/Cochin.jpg'),
              //             fit: BoxFit.cover)),
              //   ),Container(margin: EdgeInsets.only(left:20),
                 
              //     decoration: BoxDecoration(
              //         color: Colors.grey,
              //         image: DecorationImage(
              //             image: AssetImage('assets/images/allepey.jpg'),
              //             fit: BoxFit.cover)),
              //   ),
              //    ] ),
              // SizedBox(
              //   height: 20.0,
              // ),
          
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Top Destinations',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => viewall()));
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 16, color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
              SizedBox(height: 5),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return click();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        destinations(items[0]),
                        SizedBox(width: 5),
                        destinations(items[1]),
                        SizedBox(
                          width: 5,
                        ),
                        destinations(items[2]),
                        SizedBox(
                          width: 5,
                        ),
                        destinations(items[3]),
                        SizedBox(
                          width: 5,
                        ),
                        destinations(items[4])
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Top Resorts',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => viewall()));
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 16, color: Colors.white.withOpacity(0.8)),
                          ))
                    ],
                  )),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      destinations(items[13]),
                      SizedBox(width: 5),
                      destinations(items[14])
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.greenAccent,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.memory_outlined), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ''),
          ],
        )));
  }
}
