import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum ApplicationLoginState{loggedOut, loggedIn}

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;

  ApplicationState(){
    init();
  }

  Future<void> init() async{
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if(userFir != null){
        loginState = ApplicationLoginState.loggedIn;
        user = userFir;
      }
      else
      {
        loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }
}