// import 'dart:async';
// import 'dart:ffi';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/loginpage.dart';
import 'package:travel_app/startingpage.dart';
// import 'package:travel_app/login.dart';
// import 'package:travel_app/loginpage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:travel_app/startingpage.dart';

// class verifyemail extends StatefulWidget {
//   const verifyemail({Key? key}) : super(key: key);

//   @override
//   State<verifyemail> createState() => _verifyemailState();
// }

// class _verifyemailState extends State<verifyemail> {
 
//   final auth = FirebaseAuth.instance;

//   Timer? timer;

//   bool isEmailVerified = false;

//   late User currentUser;

//   @override
//   void initState() {
//     super.initState();
//     FirebaseAuth.instance.currentUser?.sendEmailVerification();
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     timer = Timer.periodic(
//       Duration(seconds: 3),
//       (_) => checkEmailVerified(),
//     );
//   }

//   checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//     if (isEmailVerified) {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (context) => starting()));
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Email Successfully Verified')));
//       timer?.cancel();
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: SingleChildScrollView(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           SizedBox(
//             height: 35,
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Center(
//             child: Text(
//               'Check your email',
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32.0),
//             child: Center(
//                 child: Text(
//               'We have sent you a email on ${auth.currentUser?.email}',
//               textAlign: TextAlign.center,
//             )),
//           ),
//           SizedBox(
//             height: 16,
//           ),
//           Center(
//             child: CircularProgressIndicator(),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 32),
//             child: Center(
//                 child: Text(
//               'Verifying Email...',
//               textAlign: TextAlign.center,
//             )),
//           ),
//           SizedBox(
//             height: 57,
//           ),
//           Padding(
//               padding: EdgeInsets.symmetric(horizontal: 32),
//               child: ElevatedButton(
//                 onPressed: () {
//                   try {
//                     FirebaseAuth.instance.currentUser?.sendEmailVerification();
//                     //checkEmailVerified();
//                   } catch (e) {
//                     debugPrint('$e');
//                   }
//                 },
//                 child: Text('Resend'),
//               ))
//         ]),
//       ),
//     ));
//   }

//   // Future<void> checkEmailVerified() async {
//   //   user = auth.currentUser!;
//   //   await user.reload();
//   //   if (user.emailVerified) {
//   //     timer?.cancel();
//   //     Navigator.of(context)
//   //         .pushReplacement(MaterialPageRoute(builder: (context) => starting()));
//   //   }
//   // }
// }
// //   bool canResendEmail = false;
// //   bool isEmailverified = false;
// //   Timer? timer;

// //   get Utils => null;
  

// //   @override
// //   void initState() {
// //     super.initState();

// //     isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
// //     if (isEmailverified) {
// //       sendVerificationemail();

// //       timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     timer?.cancel();
// //     super.dispose();
// //   }

// //   Future checkEmailVerified() async {
// //     await FirebaseAuth.instance.currentUser!.reload();
// //     setState(() {
// //       isEmailverified = FirebaseAuth.instance.currentUser!.emailVerified;
// //     });

// //     if (isEmailverified) timer?.cancel();
// //   }

// //   Future sendVerificationemail() async {
// //     try {
// //       final user = FirebaseAuth.instance.currentUser!;
// //       await user.sendEmailVerification();
// //       setState(() => canResendEmail = false);
// //       await Future.delayed(Duration(seconds: 5));
// //       setState(() => canResendEmail = true);
// //     } catch (e) {
// //       Utils.showSnackBar(e.toString());
// //     }

// //     @override
// //     Widget build(BuildContext context) => isEmailverified
// //         ? starting()
// //         : Scaffold(
// //             appBar: AppBar(
// //               title: Text('verify email'),
// //             ),
// //             body: Padding(
// //               padding: EdgeInsets.all(16),
// //               child: Column(children: [
// //                 Text('A verification email has been sent to your email '),
// //                 SizedBox(
// //                   height: 25,
// //                 ),
// //                 ElevatedButton(
// //                     onPressed: canResendEmail ? sendVerificationemail : null,
// //                     child: Text('Resend'))
// //               ]),
// //             ),
// //           );
// //   }

// // //   @override
// // //   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// // // }
// // }
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const starting();
    }
    return const login();
  }
}