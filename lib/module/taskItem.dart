import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoshehab/model/firebasemodel.dart';
import 'package:todoshehab/module/newtaskitem.dart';
import 'package:todoshehab/shared/network/locale/firebase.dart';

class taskitem extends StatelessWidget {
tasks taska;
taskitem(this.taska);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion:StretchMotion(),
      children: [
        SlidableAction(onPressed:(context) {
          deletetaskfromfirebase(taska);
        },
          icon: Icons.delete,
          label: "Delete",
          backgroundColor: Colors.red,
        ),
        SlidableAction(onPressed: (context){
          deletetaskfromfirebase(taska);
          Navigator.pushNamed(context, newtaskitem.routeName);
        },
          icon:Icons.edit,
          label: "Edit",
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ],

      ),
      child: Container(
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 4,
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(5)
            ),
          ),
          SizedBox(width: 40,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taska.task,style:Theme.of(context).textTheme.headline1?.copyWith(
                  color:Theme.of(context).colorScheme.primary,
                ) ,),
                SizedBox(height: 10,),
                Text(taska.discrebtion),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add),))

        ],
      ),
  ),
    );
  }
}
