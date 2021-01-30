import 'package:app/screen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserRegister extends StatefulWidget {
  static String id='register';
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

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
                    // try{
                    //   _auth.createUserWithEmailAndPassword(
                    //       email: email, password: password);
                    //   _firestore.collection('Users').doc(email).set({
                    //     'name': name,
                    //     'surName': surname,
                    //   });
                    // }catch(e){
                    //   print(e);
                    // }
                    Navigator.pushNamed(context, HomeScreen.id);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
