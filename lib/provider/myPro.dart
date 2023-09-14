import 'package:flutter/material.dart';

class myProvider extends ChangeNotifier{
  String langcode="en";
  ThemeMode themeMode=ThemeMode.light;
  DateTime datea=DateTime.now();
  void changeLang(String lang){
    langcode=lang;
    notifyListeners();
  }

void changeTime(DateTime dateTime){
  datea=dateTime;
  notifyListeners();
}
void changetheme(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
}
}