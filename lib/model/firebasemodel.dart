class tasks{
  String id;
  String task;
  String discrebtion;
  int date;
  bool isDone;
   tasks({required this.date,required this.discrebtion,this.id='',required this.task,this.isDone=false});
  Map<String,dynamic> toJson(){
      return{
        "id":id,
      "task":task,
    "discrebtion":discrebtion,
    "date":date,
    "isDone":isDone,};
  }
tasks.fromJson(Map<String,dynamic>json):this(
  id:json["id"],
  task: json["task"],
  discrebtion: json["discrebtion"],
  date: json["date"],
  isDone: json["isDone"],
);

}