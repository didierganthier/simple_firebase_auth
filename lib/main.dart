import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_firebase_auth/auth_service.dart';
import 'package:simple_firebase_auth/home_page.dart';

void main() => runApp(
  ChangeNotifierProvider<AuthService>(
    child: MyApp(),
    create: (BuildContext context){
      return AuthService();
    },
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}
