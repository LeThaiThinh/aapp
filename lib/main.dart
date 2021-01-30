import 'file:///C:/Users/letha/AndroidStudioProjects/app/lib/screen/HomeScreen.dart';
import 'file:///C:/Users/letha/AndroidStudioProjects/app/lib/screen/LogRegScreen.dart';
import 'package:app/forms/login.dart';
import 'package:app/forms/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: LogRegScreen(),
      routes: {
        LogRegScreen.id: (context) => LogRegScreen(),
        HomeScreen.id: (context)=>HomeScreen(),
        UserRegister.id :(context)=>UserRegister(),
        UserLogin.id :(context)=>UserLogin(),
      }
    );
  }
}


