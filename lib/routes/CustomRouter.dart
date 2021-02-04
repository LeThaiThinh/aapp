import 'package:app/pages/AboutPage.dart';
import 'package:app/pages/HomePage.dart';
import 'package:app/pages/NotFoundPage.dart';
import 'package:app/pages/SettingPage.dart';
import 'package:app/screen/MenuPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RouteName.dart';

class CustomRouter{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_)=>HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_)=>AboutPage());
      case settingRoute:
        return MaterialPageRoute(builder: (_)=>SettingPage());
      case menuRoute:
        print("qưe");
        return MaterialPageRoute(builder: (_)=>MenuPage());
    }
    return MaterialPageRoute(builder: (_)=>NotFoundPage());
  }
}