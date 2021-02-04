import 'file:///C:/Users/letha/AndroidStudioProjects/app/lib/routes/CustomRouter.dart';
import 'package:app/routes/RouteName.dart';
import 'package:app/screen/LogRegScreen.dart';
import 'package:app/screen/MenuPage.dart';
import 'package:app/screen/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'forms/login.dart';
import 'forms/register.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

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
        title: "hello",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        // home: LogRegScreen(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en','US'),
          Locale('vi','VN'),
          Locale('zh','CN'),
        ],
        // localeResolutionCallback:,
        onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: homeRoute,
    );
  }

}


