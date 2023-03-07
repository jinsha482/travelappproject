import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/create.dart';
import 'package:travel_app/forgotpassword.dart';
import 'package:travel_app/loginpage.dart';

import 'package:travel_app/provider/provider.dart';
import 'package:travel_app/services/firebase_auth_methods.dart';

import 'package:travel_app/startingpage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:travel_app/utils/showSnackbar.dart';

import 'controller/login_controller.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool visible = false;

  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool _showpassword = true;

//  void loginUser() {
//     context.read<FirebaseAuthMethods>().loginWithEmail(
//           email: email.text,
//           password: pass.text,
//           context: context,

//         );
//   }
  late Box box1;
  @override
  
  void initState() {
    super.initState();
    createOpenBox();
    getdata();
  }

  void createOpenBox() async {
    box1 = await Hive.openBox('logindata');
    getdata();
  }

  void getdata() async {
    if (box1.get('email') != null) {
      email.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('pass') != null) {
      pass.text = box1.get('pass');
      isChecked = true;
      setState(() {});
    }
  }
  
  
  

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.direction > 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => login()));
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/2699342.jpg'),
                  fit: BoxFit.fill),
            ),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 90,
                      width: 340,
                      child: TextFormField(
                        autofocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter correct email";
                          } else if (!regex.hasMatch(value)) {
                            return "Please provide a valid emal address";
                          } else {
                            return null;
                          }
                        },
                        controller: email,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.white70,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Username'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 340,
                      height: 90,
                      child: TextFormField(
                        autofocus: false,
                        validator: (value) =>
                            value!.isEmpty ? "Please enter Password" : null,
                        obscureText: _showpassword,
                        controller: pass,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Colors.white70),
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
                                        color: Colors.white70,
                                      )),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Password'),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.white54),
                        ),
                        Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = !isChecked;
                              setState(() {});
                            })
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => forgot()));
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ))),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white70,
                              foregroundColor: Colors.blue.shade500,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17)))),
                          onPressed: () {
                            remindme();
                            setState(() {
                              visible = true;
                            });
                            signIn(email.text, pass.text);
                          }
                          //loginUser,

                          //  // isLogin.value ? login() : create();

                          //   if (formKey.currentState!.validate()) {
                          //     //loginController.loginWithEmail();
                          //     _login("email", "password", context);
                          //   }
                          // },
                          ,
                          child: Center(child: Text('Login'))),
                    ),
                    // auth.loggedInStatus == Status.Authenticating
                    //     ? loading
                    //     : longButtons('Login', doLogin),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t' '  ' 'have an account? ',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 2),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => create(),
                                ));
                              },
                              child: Text(
                                'Create',
                                style: TextStyle(color: Colors.white70),
                              ))
                        ],
                      ),
                    )
                  ]),
            ),
          )),
    );
  }

  void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => starting(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        showSnackBar(context, e.message!);
      }
    }
  }

  void remindme() {
    if (isChecked) {
      box1.put('email', email.text);
      box1.put('pass', pass.text);
    }
    
    
  }

  // void _login(String email, String password, BuildContext context) async {
  //   ProviderState providerState =
  //       Provider.of<ProviderState>(context, listen: false);
  //   try {
  //     if (await providerState.SigninUserAccount(email, password)) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => starting()));
  //     }
  //   } catch (e) {}
  // }
}







































  // void hello() {
  //   if (isChecked) {
  //     box1.put('email', email.text);
  //     box1.put('pass', pass.text);
  //   }
  // }

  // void _login(String email, String password, BuildContext context) async {
  //   ProviderState providerState =
  //       Provider.of<ProviderState>(context, listen: false);
  //   try {
  //     if (await providerState.SigninUserAccount(email, password)) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => starting()));
  //     }
  //   } catch (e) {}
  // }





















// // TextEditingController email = TextEditingController();

  // // TextEditingController pass = TextEditingController();

  // late Box box1;
  // @override
  // void initState() {
  //   super.initState();
  //   createBox();
  //   getdata();
  // }

  // void createBox() async {
  //   box1 = await Hive.openBox('logindata');
  //   getdata();
  // }

  // void getdata() async {
  //   if (box1.get('email') != null) {
  //     email.text = box1.get('email');
  //     isChecked = true;
  //     setState(() {});
  //   }
  //   if (box1.get('pass') != null) {
  //     pass.text = box1.get('pass');
  //     isChecked = true;
  //     setState(() {});
  //   }
  // }

 

  //   // final loading = Row(
  //   //   mainAxisAlignment: MainAxisAlignment.center,
  //   //   children: <Widget>[
  //   //     CircularProgressIndicator(),
  //   //     Text(" Login ... Please wait")
  //   //   ],
  //   // );

  //   //




 // TextEditingController email = TextEditingController();

  // TextEditingController pass = TextEditingController();

  // late Box box1;
  // @override
  // void initState() {
  //   super.initState();
  //   createBox();
  //   getdata();
  // }

  // void createBox() async {
  //   box1 = await Hive.openBox('logindata');
  //   getdata();
  // }

  // void getdata() async {
  //   if (box1.get('email') != null) {
  //     email.text = box1.get('email');
  //     isChecked = true;
  //     setState(() {});
  //   }
  //   if (box1.get('pass') != null) {
  //     pass.text = box1.get('pass');
  //     isChecked = true;
  //     setState(() {});
  //   }
 // }
