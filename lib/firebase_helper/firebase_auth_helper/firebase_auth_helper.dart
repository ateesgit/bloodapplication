import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloodapplication/constants/constants.dart';
// import 'package:shopeeapp_user/constants/routes.dart';
// import 'package:shopeeapp_user/screens/home/home.dart';

class FirebaseAuthHelper{
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
    String email,String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
    await  _auth.signInWithEmailAndPassword(email: email, password: password);
    // Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
    Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (error) {
      showMessage(error.code.toString());
      return false;
    }
    
  }
  
  Future<bool> signUp(
    String email,String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
    await  _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
    Navigator.of(context).pop();
      return true;
    }on FirebaseAuthException catch (error) {
      showMessage("hi..."+error.code.toString());
      return false;
    }
  }
}