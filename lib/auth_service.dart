import 'package:flutter/material.dart';

//{}

class AuthService with ChangeNotifier {
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
}