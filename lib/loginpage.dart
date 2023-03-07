import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/create.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/startingpage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  

    
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => welcomepage_one()));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/image2.png'),fit: BoxFit.cover)),
        child: Container(
          
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(height: 20,),Icon(Icons.lock,size: 40,color: Colors.white54),SizedBox(height: 40,)
          ,  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 360,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        backgroundColor: Colors.blue.shade200,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => loginpage(),
                        ));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 360,
                  height: 50,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green.shade100,
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => create(),
                        ));
                      },
                      child: Text(
                        'Create account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
