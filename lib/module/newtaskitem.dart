import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoshehab/model/firebasemodel.dart';
import 'package:todoshehab/provider/myPro.dart';
import 'package:todoshehab/shared/componant/showMasseges.dart';
import 'package:todoshehab/shared/network/locale/firebase.dart';

class newtaskitem extends StatefulWidget {
  static const String routeName = "task";

  @override
  State<newtaskitem> createState() => _newtaskitemState();
}

class _newtaskitemState extends State<newtaskitem> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var describtionController = TextEditingController();

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: 40,
        title: Text("Edit"),
      ),
      body: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.add,color: Colors.blue,),
        ),
        body: Padding(
          padding: EdgeInsets.all(80.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "edit item",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "please write your dicrebtion";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Enter your name",
                            labelText: "name",
                            labelStyle: Theme.of(context).textTheme.headline1,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                          controller: describtionController,
                          maxLines: 6,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "please write your decribtion";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "enter your describtion",
                            labelText: "describtion",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            labelStyle: Theme.of(context).textTheme.headline1,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: (){
                            showdate(context);
                            pro.changeTime(dateTime);
                          },
                          child: Text(
                            "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  tasks task = tasks(
                                      date: dateTime.microsecondsSinceEpoch,
                                      discrebtion: describtionController.text,
                                      task: nameController.text);
                                  addtasktofirebase(task);
                                  hideLoading(context);
                                }
                              },
                              child: Text("new item"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void showdate(context)async {
     DateTime? date=await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),);
     if(date==null)return;
     dateTime=date;
     setState((){});

  }
}
