import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String Email, String Password, context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: Email, password: Password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
        padding: EdgeInsets.all(25),
      ));
    }
  }

  Future login(String Email, String Password, context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: Email, password: Password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  Future resetPassword(String Email, context) async {
    try{
      await firebaseAuth.sendPasswordResetEmail(email: Email);
    }on FirebaseAuthException
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }
  }

  Future logout(context) async{
    try{
      await firebaseAuth.signOut();
    }on FirebaseException catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.deepOrange,
      ));
    }

  }
}

