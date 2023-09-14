import 'package:flutter/material.dart';
import 'package:todoshehab/model/firebasemodel.dart';
import 'package:todoshehab/shared/componant/showMasseges.dart';
import 'package:todoshehab/shared/network/locale/firebase.dart';

class bottomsheet extends StatefulWidget {
  @override
  State<bottomsheet> createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  var taskcontroller=TextEditingController();
  var discribtionController=TextEditingController();
  DateTime selectable=DateTime.now();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("Add New Task",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),),
          SizedBox(height: 20,),
          Expanded(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (text){
                      if(text==null||text.isEmpty){
                        return "enter your task";
                      }
                      return null;
                    },
                    controller:taskcontroller,
                    decoration: InputDecoration(
                      hintText: "enter your task",
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (text){
                      if( text==null  || text.isEmpty){
                        return "enter your decrebtion";
                      }
                      return null;
                    },
                    maxLines: 5,
                    controller:discribtionController,
                    decoration: InputDecoration(
                      hintText: "enter your discrption",
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ) ,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Select Date",style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                    ),
                  InkWell(
                    onTap:(){
                      return selectdate();
                      },
                    child: Text("${selectable.year}/${selectable.month}/${selectable.day}",
                      textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                   tasks task=tasks(
                        date: selectable.microsecondsSinceEpoch,
                        discrebtion: discribtionController.text,
                        task: taskcontroller.text);
                   ShowLoading(context, "loading",false);
                         addtasktofirebase(task);
                       hideLoading(context);
                       showMasseges(context, () {
                         hideLoading(context);
                         hideLoading(context);
                       }, false);
                    }
                  }, child: Text("New Task"),),




                ],
              ),
            ),
          )
        ],
      ),
    );
  }
 void selectdate()async{
     DateTime? datepaker=await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 356)),
        lastDate: DateTime.now().add(Duration(days: 365)));
     if(datepaker==null)return;
        selectable=datepaker;
        setState((){});
  }
}
