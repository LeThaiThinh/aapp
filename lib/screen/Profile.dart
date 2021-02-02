import 'package:app/forms/login.dart';
import 'package:app/forms/register.dart';
import 'package:app/screen/LogRegScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{
  static String id = 'ProfileScreen';
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    User user=FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title:Text('LogRegScreen'),
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              user==null? {
                Text(user.displayName),
                Text(user.email),
                Text(user.photoURL),
              }:Text("error"),
              RaisedButton(
                child: Text('Log out'),
                onPressed: (){
                  Navigator.pushNamed(context,LogRegScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
