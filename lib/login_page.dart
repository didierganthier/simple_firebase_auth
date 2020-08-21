import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page Flutter Firebase'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(),
      ),
    );
  }
}
