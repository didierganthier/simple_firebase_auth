import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser currentUser;

  const HomePage({this.currentUser});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Flutter Firebase'),
      ),
      body: Center(
        child: Text('Home Page Flutter Firebase Content'),
      ),
    );
  }
}
