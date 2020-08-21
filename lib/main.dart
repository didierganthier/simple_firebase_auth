import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_firebase_auth/auth_service.dart';
import 'package:simple_firebase_auth/home_page.dart';
import 'package:simple_firebase_auth/loading_circle.dart';
import 'package:simple_firebase_auth/login_page.dart';

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
      home: FutureBuilder(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.error != null){
              print("error");
              return Text(snapshot.error.toString());
            }
            return snapshot.hasData? HomePage(currentUser: snapshot.data) : LoginPage();
          } else {
            return Center(
              child: LoadingCircle(),
            );
          }
        },
      ),
    );
  }
}
