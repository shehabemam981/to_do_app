import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoshehab/layout/homescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoshehab/module/newtaskitem.dart';
import 'package:todoshehab/provider/myPro.dart';
import 'package:todoshehab/shared/styles/themes.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( ChangeNotifierProvider(

      create: (BuildContext context) {
       return myProvider();
      },
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // arabic
      ],
      locale: Locale(pro.langcode),
      routes:
      {
       home_screen.routeName:(c)=>home_screen(),
        newtaskitem.routeName:(c)=>newtaskitem(),
      },
      initialRoute: home_screen.routeName,
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.DarkTheme,
      themeMode: pro.themeMode,
    );
  }
}