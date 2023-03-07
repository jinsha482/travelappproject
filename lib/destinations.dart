import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/destination.dart';

Widget destinations(destination model) {
  return InkWell(
    child: Container(
      child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(children: [
            Stack(children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage(model.thumbnail.toString()),
                        fit: BoxFit.cover)),
              ),
              Positioned(top: 10, left: 20, child: Text(model.videotitle.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.white70),))
            ])
          ])),
    ),
  );
}

List items = [destination("assets/images/allepey.jpg","Allepey"),destination("assets/images/ashtamud.jpg", "Ashtamudi"),destination("assets/images/kollam.jpg", "Kollam"),destination("assets/images/kovalam.jpg", "Kovalam"),destination("assets/images/Cochin.jpg","Cochin"),destination("assets/images/Kozhikode.jpg","Kozhikode"),destination("assets/images/Guruvayur.jpg","Guruvayur"),destination("assets/images/kumarakom.jpg","Kumarakom"),destination("assets/images/Munnar.jpg","Munnar"),destination("assets/images/Thekkady.jpg","Thekkady"),destination("assets/images/kumarakom.jpg","Vagamon"),destination("assets/images/kumarakom.jpg","Wayanad"),destination("assets/images/bekayali.jpg","Bekali"),destination("assets/images/Arayal Luxury Resort.jpeg","Arayal Luxury Resort"),destination("assets/images/Le Meridien Kochi.jpeg", "Le Meridien Kochi")];
