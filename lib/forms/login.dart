import 'package:app/screen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UserLogin extends StatefulWidget {
  static String id='login';
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'email'
                ),
                onChanged: (input){
                  email=input;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'password'
                ),
                onChanged: (input){
                  password=input;
                },
              ),
              RaisedButton(
                  child: Text('Login'),
                  onPressed: (){
                    // _auth.signInWithEmailAndPassword(
                    //     email: email, password: password
                    // );
                    Navigator.pushNamed(context, HomeScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}