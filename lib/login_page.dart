import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_firebase_auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page Flutter Firebase'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Text(
                'Login Information',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onSaved: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email Adress'),
              ),
              TextFormField(
                onSaved: (value) => _password = value,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () async{
                  final form = _formKey.currentState;
                  form.save();
                  if(form.validate()){
                    var result = await Provider.of(context).loginUser(email: _email, password: _password);
                    if(result == null){
                      return _buildShowErrorDialog(context, 'Error logging in with those credentials');
                    }
                  }
                },
                child: Text("LOGIN"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future _buildShowErrorDialog(BuildContext context, _message){
  return showDialog(
    builder: (context){
      return AlertDialog(
        title: Text('Error Message'),
        content: Text(_message),
        actions: [
          FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
        ],
      );
    },
    context: context,
  );
}