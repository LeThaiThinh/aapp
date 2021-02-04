import 'package:app/routes/RouteName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
      ),
      body: Container(
        child: MaterialButton(
          color: Colors.blue,
          child: Text("Navigator to setting page"),
          onPressed: (){
            Navigator.pushNamed(context, settingRoute);
          },
        ),
      ),
    );
  }
}
