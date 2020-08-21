import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//{}

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getUser() async{
    return _auth.currentUser;
  }

  //wrapping the firebase calls
  Future logout() async{
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  //wrapping the firebase calls
  Future createUser(
      {String firstName,
       String lastName,
       String email,
       String password}) async {}

  //log in the user if password matches
  Future loginUser({String email, String password}) async{
    try{
      var result = FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      return result;
    }
    catch(e){
      throw new FirebaseAuthException(message: e.message, code: e.code);
    }
  }
}