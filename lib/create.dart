import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:get/get.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/loginpage.dart';

import 'package:travel_app/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/sendemail.dart';
import 'package:travel_app/services/firebase_auth_methods.dart';
import 'package:travel_app/startingpage.dart';
import 'package:travel_app/utils/showSnackbar.dart';

import 'controller/registration_controller.dart';

class create extends StatefulWidget {
  create({Key? key}) : super(key: key);

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  bool showProgress = false;
  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
//  void signUpUser() async {
//     context.read<FirebaseAuthMethods>().signUpWithEmail(
//           email: email.text,
//           password: pass.text,
//           context: context,
//         );
//   }

  //var isLogin = false.obs;
  // RegisterationController registerationController =
  //     Get.put(RegisterationController());
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final formKey = GlobalKey<FormState>();
  bool _showpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/148839.jpg'),
                fit: BoxFit.fill)),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 120),
              Text(
                'Create Account',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: email,
                  
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter correct email";
                    } else if (!regex.hasMatch(value)) {
                      return "Please provide a valid emal address";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      )),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter correct name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 370,
                child: TextFormField(
                  controller: pass,
                  autofocus: false,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z 0-9 @ # $ & * ~ _]+$')
                            .hasMatch(value)) {
                      return "Enter valid Password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_showpassword == true) {
                              _showpassword = false;
                            } else {
                              _showpassword = true;
                            }
                          });
                        },
                        icon: _showpassword
                            ? Icon(Icons.visibility_off)
                            : Icon(
                                Icons.visibility,
                                color: Colors.white60,
                              ),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white70,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        foregroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),//onPressed:signUpUser,
                    onPressed: ()  {
                       setState(() {
                                  showProgress = true;
                                });
                                signUp(
                                  email.text,
                                  pass.text,
                                );
                    },
                    //  // isLogin.value ? login() : create();

                    //   if (formKey.currentState!.validate()) {
                    //     registeruser(email, "password", context);
                    //     // registerationController.registerWithEmail();
                    //   }
                    // },
                    child: Center(child: Text('Create Account'))),
              ),
              SizedBox(height: 30),
              Center(
                  child: Text(
                'OR',
                style: TextStyle(color: Colors.white70),
              )),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => loginpage(),
                        ));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white70),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

 signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .whenComplete(() => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => loginpage(),
                    ),
                  )
                });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
        showSnackBar(
          context, e.message!);
      } catch (e) {
        print(e);
      }
    }

    CircularProgressIndicator();
  }


  // void registeruser(String email, String password, BuildContext context) async {
  //   ProviderState providerState =
  //       Provider.of<ProviderState>(context, listen: false);
  //   try {
  //     if (await providerState.CreateUserAccount(email, password)) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => starting()));
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
