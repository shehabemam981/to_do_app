import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoshehab/provider/myPro.dart';

import '../shared/componant/languagesheet.dart';
import '../shared/componant/themesheet.dart';

class setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Language",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.black,
                  ),
            ),
            InkWell(
              onTap: () {
                Showlanguagesheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (pro.langcode=="en")?"english":"arabic",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Mode",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.black,
                  ),
            ),
            InkWell(
              onTap: (){
                showthemesheet(context);

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (pro.themeMode==ThemeMode.light)?"light":"dark",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Showlanguagesheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return languagemodal();
        });

  }
  showthemesheet(context){
   showModalBottomSheet(context: context,
       builder: (context){
     return Themesheet();
       });
  }
}
