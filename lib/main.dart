import 'file:///C:/Users/letha/AndroidStudioProjects/app/lib/routes/CustomRouter.dart';
import 'package:app/localization/DemoLocalization.dart';
import 'package:app/routes/RouteName.dart';
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

  static void setLocale(BuildContext context,Locale locale){
    _MyAppState state=context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  void setLocale(Locale locale){
    setState(() {
      _locale=locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hello",
        theme: ThemeData.fallback(),
        debugShowCheckedModeBanner: false,
        // home: LogRegScreen(),
        localizationsDelegates: [
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        localeResolutionCallback: (deviceLocale,supportedLocales){
          for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode
                && locale.countryCode==deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        supportedLocales: [
          Locale('en','US'),
          Locale('vi','VN'),
          // Locale('zh','CN'),
        ],
        // localeResolutionCallback:,
        onGenerateRoute: CustomRouter.allRoutes,
        initialRoute: homeRoute,
    );
  }

}


