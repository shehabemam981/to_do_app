import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoshehab/model/firebasemodel.dart';
import 'package:todoshehab/module/taskItem.dart';
import 'package:todoshehab/provider/myPro.dart';

import '../shared/network/locale/firebase.dart';

class list extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            shrink: true,
            initialDate: pro.datea,
            firstDate: DateTime.now().subtract(Duration(days:  2000)),
            lastDate: DateTime.now().add(Duration(days: 2000)),
            onDateSelected: (dateTime) {

              pro.changeTime(dateTime);
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.teal[200],
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).colorScheme.primary,
            dotsColor: Color(0xFF333A47),
            locale: 'en_ISO',
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<tasks>>(
              stream:  getdatafromfirebase(pro.datea) ,
                builder: (context, snapshot) {
             if (snapshot.hasError){
               return Center(
                 child: Text(" you has error"),
               );
             }
             if(snapshot.connectionState==ConnectionState.waiting){
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
             var taska=snapshot.data!.docs.map((e) => e.data()).toList();
             return ListView.separated(
               separatorBuilder: (context,index){
                 return SizedBox(
                   height: 10,
                 );
               },
               itemBuilder:(context,index){
               return taskitem(taska[index]);
             },
               itemCount: taska.length,
            );
                }
              ),
          ),

        ],
    )
    );
  }
}
