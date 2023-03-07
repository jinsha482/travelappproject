import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class otps extends StatefulWidget {
  const otps({Key? key}) : super(key: key);

  @override
  State<otps> createState() => _otpsState();
}

 class _otpsState extends State<otps> {
  final mobilenum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/image2.png',),fit: BoxFit.fill)),
    child: Column(children: [SizedBox(height: 220),Center(child: Text('Enter OTP',style: TextStyle(color: Colors.white70,fontSize: 30,fontWeight: FontWeight.w600),)),SizedBox(height: 25,),Container(margin:EdgeInsets.only(left: 10),child: Text('An 5 digit code has been sent to your mobile number ',style:TextStyle(color:Colors.white70,fontSize: 17,fontWeight: FontWeight.w400))),SizedBox(height: 40),OtpTextField(
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
       
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ),],),),);
  }
}
