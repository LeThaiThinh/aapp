import 'dart:collection';

import 'package:app/screen/LogRegScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
class UserRegister extends StatefulWidget {
  static String id='register';
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  CollectionReference db=FirebaseFirestore.instance.collection("Users");
  List<DocumentSnapshot> snapshots;
  String data;
  String name;
  String surname;
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
                  hintText: 'name'
                ),
                onChanged: (input){
                  name=input;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'surname'
                ),
                onChanged: (input){
                  surname=input;
                },
              ),
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
                  child: Text('Register'),
                  onPressed: (){
                    try{
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email, password: password);
                      FirebaseAuth.instance.currentUser.updateProfile(displayName: name);
                      _firestore.collection('Users').
                          add({
                        'name': name,
                        'phone': surname,
                        });

                    }catch(e){
                      print(e);
                    }
                    Navigator.pushNamed(context, LogRegScreen.id);
                  }),
              RaisedButton(
                  child: Text('get'),
                  onPressed: (){
                    try{
                      db.snapshots().listen((event) {
                        setState(() {
                          data=event.docs[1].data()["name"];
                        });
                      });
                    }catch(e){
                      print(e);
                    }
                  }),
              Text(
                data!=null?data:"non"
              )
            ],
          ),
        ),
      ),
    );
  }
}
