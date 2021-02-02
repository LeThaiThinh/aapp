import 'package:app/screen/LogRegScreen.dart';
import 'package:app/screen/Menu.dart';
import 'package:app/screen/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'forms/login.dart';
import 'forms/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: LogRegScreen(),
        routes: {
          Profile.id:(context)=>Profile(),
          LogRegScreen.id: (context) => LogRegScreen(),
          UserRegister.id :(context)=>UserRegister(),
          UserLogin.id :(context)=>UserLogin(),
          Menu.id :(context)=>Menu(),
        }
    );
  }

}


