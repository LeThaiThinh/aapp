import 'package:app/forms/login.dart';
import 'package:app/forms/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MenuPage.dart';

class LogRegScreen extends StatefulWidget{
  static String id = 'LogRegScreen';
  @override
  State<StatefulWidget> createState() {
    return _LogRegScreenState();
  }
}

class _LogRegScreenState extends State<LogRegScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('LogRegScreen'),
      ),
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Register'),
                onPressed: (){
                  Navigator.pushNamed(context,UserRegister.id);
                  },
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: (){
                  Navigator.pushNamed(context,UserLogin.id);
                  },
              ),
              RaisedButton(
                child: Text('Menu'),
                onPressed: (){
                  Navigator.pushNamed(context,MenuPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
