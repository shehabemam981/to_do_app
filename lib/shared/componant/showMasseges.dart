
import 'package:flutter/material.dart';

Future ShowLoading(context, String msg,bool iscancel) {
  return showDialog(
      barrierDismissible: iscancel,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Text(msg),
            CircularProgressIndicator(),
          ],
        );
      });
}

void hideLoading(context) {
  return Navigator.pop(context);
}

Future showMasseges( context, VoidCallback posaction,bool iscancel,{
  VoidCallback? negaction,
}) {
  return showDialog(
      barrierDismissible: iscancel,
      context: context,
      builder: (context) {
        List<Widget>actions=[
          TextButton(
            onPressed: posaction,
            child: Text("ok"),
          ),
        ];
        if(negaction!=null){
          actions.add( TextButton(
            onPressed: negaction,
            child: Text("cancel"),
          ),);
        }

        return AlertDialog(
          title: Text("are you want save ?"),
          actions:actions,
        );
      });
}
