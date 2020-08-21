import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;
  
  AuthService(){
    print("new AuthService");
  }
}