import 'dart:math';

import 'file:///C:/Users/letha/AndroidStudioProjects/app/lib/screen/LogRegScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  static String id = 'HomeScreen';
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  FirebaseAuth _auth=FirebaseAuth.instance;

  String name='';
  String surname='';
  String email='';
  String password='';

  void updateName(String name){
    setState(() {
      this.name=name;
    });
  }
  void updateSurName(String surname){
    setState(() {
      this.surname=surname;
    });
  }
  void updateEmail(String email){
    setState(() {
      this.email=email;
    });
  }
  void updatePassword(String password){
    setState(() {
      this.password=password;
    });
  }
  void logIn(String email,String password) async{
    if(email!='' && password !=''){
      try{
        _auth.signInWithEmailAndPassword(email: email, password: password);
      }catch(e){
        print(e);
      }
    }
  }
  void initState(){
    logIn(email, password);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(name),
              Text(surname),
              RaisedButton(
                child: Text('Log Reg Screen'),
                onPressed: (){
                  Navigator.pushNamed(context,LogRegScreen.id);
                  },
              )
            ],
          ),
        ),
      ),
    );
  }

}