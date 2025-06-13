class Todo {
  int? id; //id is optional until saved, so it can be null
  String title;
  bool isDone;
  Todo({this.id, required this.title, this.isDone = false});


  //functions to convert from JSON and to JSON(sembast can only hold JSON)

  //converts the Todo instance to JSON from list.
  //since JSON is structured like a Map, the return type of the function is a Map
  //we dont have to pass ToDo instance here as according to OOP, this method is unique to each instance,
  //which means that it is not static
  
  Map<String,dynamic> toJson(){
    return{
      'title': title,
      'isDone': isDone
    };
  }

  //a named constructor which makes JSON into list form of Todo()
  //recordId comes from the sembast snapshot
  factory Todo.fromJson(Map<String, dynamic> json, int recordId){
    return Todo(
      id: recordId,
      title: json['title'] as String,
      isDone: json['isDone'] as bool,
    );
  }
}