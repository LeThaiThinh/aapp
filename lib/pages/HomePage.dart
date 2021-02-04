import 'package:app/classes/language.dart';
import 'package:app/localization/DemoLocalization.dart';
import 'package:app/localization/LocalizationConstant.dart';
import 'package:app/pages/AboutPage.dart';
import 'package:app/pages/SettingPage.dart';
import 'package:app/routes/RouteName.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  void _showSuccessDialog(){
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  void _changeLanguage(Language language){
    Locale _temp;
    switch(language.languageCode){
      case 'en':
        _temp=Locale(language.languageCode,'🇺🇸');
        break;
      case 'vi':
        _temp=Locale(language.languageCode,'VN');
        break;
      default:
        _temp=Locale(language.languageCode,'🇺🇸');

    }
    MyApp.setLocale(context,_temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerList(),
      appBar: AppBar(
        title: Text(getTranslated(context, "homePage")),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child:DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items:
                Language.languageList()
                .map<DropdownMenuItem<Language>>((lang)=>DropdownMenuItem(
                    value: lang,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(lang.flag),
                        Text(lang.name,style: TextStyle(fontSize: 30),),
                      ],
                    )
                )).toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
            ),
          )
        ],
      ),
      body:Container(
        child: _mainForm(context),
      ),
    );
  }

  Container _drawerList(){
    TextStyle _textStyle=TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      color: Theme.of(context).primaryColor,
      child: ListView(
      children:[
        DrawerHeader(
          child: Container(
              height: 100,
              child: CircleAvatar(),
          ),
        ),
        ListTile(
          leading:Icon(
            Icons.info,
            color: Colors.white,
            size: 30,
        ),
          title: Text(
            'About Us',
            style: _textStyle,
          ),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, aboutRoute);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Setting',
            style: _textStyle,
          ),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, settingRoute);
          },

        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            'Menu',
            style: _textStyle,
          ),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, menuRoute);
          },

        ),
      ],
      ),
    );
  }

  _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/4,
            child: Center(
              child: Text(
                getTranslated(context, "personalInfo"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val){
              if(val.isEmpty){
                return 'requiredField';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'Enter Name'
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            validator: (val){
              if(val.isEmpty){
                return 'requiredField';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter Email'
            ),
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date Of Birth',
                hintText: 'Enter Date Of Birth',
            ),
            onTap: ()async{
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year),
                  lastDate: DateTime(DateTime.now().year+20)
              );
            },
          ),
          SizedBox(height: 30,),
          MaterialButton(
            onPressed: (){
              if(_key.currentState.validate()){
                _showSuccessDialog();
              }
            },
            height: 30,
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Submit Information',
                style: TextStyle(color: Colors.white,fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
