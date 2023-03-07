import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/login.dart';
import 'package:travel_app/otp.dart';
import 'package:travel_app/reset.dart';

class forgot extends StatefulWidget {
  const forgot({Key? key}) : super(key: key);

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
        body: Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/image1.jpg'),fit: BoxFit.fill)),
      child: Form(key: formkey,
        child: Column(children:[SizedBox(height: 320,),
         
         
         
          Text(
            'Forgot Password ?',textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25),
          Container(margin: EdgeInsets.only(left: 10),
            child: Text(
        'Don\'t'
        ' '
        'worry!'
        ' '
        'It happens. Please enter the address associated with your account',
        style: TextStyle(
              color: Colors.white70, fontSize: 17,),
            ),
          ),
          SizedBox(
        height: 35,
          ),
          SizedBox(width: 370,
            child: TextFormField( validator: (value) {
                              if (value!.length == 0) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              // emailController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                
                controller: email,decoration:InputDecoration(prefixIcon:Icon(Icons.alternate_email,color: Colors.white70,),border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),hintText: 'Email ID')
             ),
          ),SizedBox(height: 50,),
           SizedBox(width: 250,height: 50,
             child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.white70,foregroundColor: Colors.blue,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)))),
                        onPressed: (){ Forgotpassss(email.text);
                                  setState(() {
                                    visible = true;
                                  });}, child: Text('Submit',)),
           ),
            ]),
      ),
    ));
  }
   void Forgotpassss(String email) async {
    if (formkey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => loginpage()))
              })
          .catchError((e) {});
    }
  }
}
