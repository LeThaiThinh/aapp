import 'package:app/localization/DemoLocalization.dart';
import 'package:flutter/cupertino.dart';

String getTranslated(BuildContext context,String key){
  return DemoLocalizations.of(context).getTranslatedValue(key);
}