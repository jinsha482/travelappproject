import 'package:flutter/material.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final password1 = TextEditingController();
  final newpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: Column(children: [
                  Image.asset(
                    'assets/images/reset.jpg',
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Reset Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: password1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'New password'),
                  ),SizedBox(height: 15,), TextField(
                    controller: newpassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: ' Confirm new password'),
                  ),SizedBox(height: 50,)  ,ElevatedButton(style:ElevatedButton.styleFrom(fixedSize:Size(440,40),backgroundColor: Colors.blue,shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.white70),)),
              
                ]))));
  }
}
