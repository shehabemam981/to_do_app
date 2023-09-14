// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:todoshehab/model/firebasemodel.dart';
//
// CollectionReference<tasks> collectionref() {
//   return FirebaseFirestore.instance.collection("tasks").withConverter<tasks>(
//         fromFirestore: (snapshot, options) => tasks.fromJson(snapshot.data()!),
//         toFirestore: (value, options) => value.toJson(),
//       );
// }
//
// Future<void> addtasktofirebase(tasks task) {
//   var collection = collectionref();
//   var docref = collection.doc();
//   task.id = docref.id;
//   return docref.set(task);
// }
//
// Stream<QuerySnapshot<tasks>> gettaskfromfirebase(DateTime datetime) {
//   return collectionref()
//       .where("date",
//           isEqualTo: DateUtils.dateOnly(datetime).microsecondsSinceEpoch)
//       .snapshots();
// }
//   Future<void> deletetaskfrommfirebase(tasks task){
//   return collectionref().doc(task.id).delete();
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/firebasemodel.dart';

CollectionReference<tasks> collectionReference(){
  return FirebaseFirestore.instance.collection("tasks").withConverter(
      fromFirestore: (snapshot, options) => tasks.fromJson(snapshot.data()!),
      toFirestore: (value,options)=>value.toJson());
}
Future<void> addtasktofirebase(tasks task){
  var collection=collectionReference();
  var docref=collection.doc();
  task.id=docref.id;
  return docref.set(task);
}
 Stream<QuerySnapshot<tasks>> getdatafromfirebase(DateTime date){
  return collectionReference()
      .where("date",isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch)
      .snapshots();
}
Future<void> deletetaskfromfirebase(tasks task){
  return collectionReference().doc(task.id).delete()
  .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}
void edittofirebase(tasks task){
  Map<String, Object?> newData=task as Map<String, Object?>;
  collectionReference().doc(task.id).update(newData);
}