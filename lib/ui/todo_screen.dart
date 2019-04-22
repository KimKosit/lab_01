import 'package:flutter/material.dart';
import 'package:lab_01/model/todo.dart';

class TodoScreen extends StatefulWidget{
  @override
  TodoScreenState createState() {
    return new TodoScreenState();
  }
}

class TodoScreenState extends State<TodoScreen> {
  TodoProvider todo =TodoProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Screen"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Open DB"), 
            onPressed: (){
              print("Opening DB");
              todo.open("todo.db");
              print("Opened!");
            },
          ),
          RaisedButton(
            child: Text("Insert"),
            onPressed: () async {
              Todo data = Todo();
              data.title = "test";
              data.done = false;
              Todo result = await todo.insert(data);
              print(result);
              //todo.insert(data).then((result){
                //
              //});
            },
          ),
          RaisedButton(
            child: Text("Get"),
            onPressed: () async{
              Todo data = await todo.getTodo(1);
              print(data.toMap());
            },
          ),
          RaisedButton(
            child: Text("Update"),
            onPressed: () async{
              Todo newData = Todo();
              newData.id = 1;
              newData.title = "New Test";
              newData.done = true;

              int result =await todo.update(newData);
              print(result);
            },
          ),
          RaisedButton(
            child: Text("Delete"),
            onPressed: () async{
              int result = await todo.delete(1);
              print(result);
            },
          ),
          RaisedButton(
            child: Text("Close DB"),
            onPressed: () {
              print("Closing DB");
              todo.close();
              print("Closed!");
            },
          )
        ],
      ),
    );
  }
}