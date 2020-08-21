import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//{}

class AuthService with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  var currentUser;
  
  AuthService(){
    print("new AuthService");
  }

  Future getUser(){
    return Future.value(currentUser);
  }

  //wrapping the firebase calls
  Future logout(){
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  //wrapping the firebase calls
  Future createUser(
      {String firstName,
       String lastName,
       String email,
       String password}) async {}

  //log in the user if password matches
  Future loginUser({String email, String password}){
    if(password == 'password123'){
      this.currentUser = {'email': email};
      notifyListeners();
      return Future.value(currentUser);
    }
    else {
      this.currentUser = null;
      return Future.value(null);
    }
  }
}