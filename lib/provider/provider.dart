 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';

 class ProviderState extends ChangeNotifier {
 late String _Uid, _Email;
   String get getUid => _Uid;
  String get getemail => _Email;
 FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> CreateUserAccount(String email, String password) async {
    bool success = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        _Uid = userCredential.user!.uid;
        _Email = userCredential.user!.email!;
        return success = true;
      }
    } catch (e) {
      print(e);
    }
    return success;
  }

  Future<bool> SigninUserAccount(String email, String password) async {
    bool success = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential != null) {
        _Uid = userCredential.user!.uid;
        _Email = userCredential.user!.email!;
        return success = true;
      }
    } catch (e) {
      print(e);
    }
    return success;
  }

  void signout() async {
    await _auth.signOut();
  }
}
