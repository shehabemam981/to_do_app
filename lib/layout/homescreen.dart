import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoshehab/module/bottomsheet.dart';
import 'package:todoshehab/module/setting.dart';


import '../module/list.dart';
class home_screen extends StatefulWidget {
  static const String routeName="home_screen";

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
int currentindex=0;
String name="to do list";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(name,style: Theme.of(context).textTheme.headline1,),
      ),
      body: screens[currentindex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showtextbottomsheet();        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add,color: Colors.white,),
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          )
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,

        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          onTap: (index){
            currentindex=index;
            appbartitle();
            setState((){});
          },
          currentIndex: currentindex,
          items: [
            BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/images/list.png"),),label: ""),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/setting.png"),),label:""),
          ],

        ),
      ),

    );
  }

  List<Widget> screens=[
    list(),
     setting(),

  ];
  String?  appbartitle(){
    if(currentindex==0){
      return name=AppLocalizations.of(context)!.to_do ;
    }else if(currentindex==1){
      return name="setting";
    }
  }
Future showtextbottomsheet(){
  return showModalBottomSheet(
    isScrollControlled: true,
      context: context,
      builder: (context)=>Container(
        height: MediaQuery.of(context).size.height * .60,
        child: bottomsheet(),
      ),);
}

}
