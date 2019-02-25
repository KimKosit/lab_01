import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SecondScreen extends StatelessWidget{
Future<String> get _localPath async{
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async{
  final path = await _localPath;
  return File('$path/counter.txt');
}

Future<File> writeCounter(int counter) async{
  final file = await _localFile;
  return file.writeAsString('$counter');
}

Future<int> readCounter() async{
  try{
    final file = await _localFile;
    String contents =await file.readAsString();
    return int.parse(contents);
  } catch (e){
    return 0;
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(child: Text("Read from file"),
          onPressed: (){
            readCounter().then((value){
              print(value);
            });
          },),
          FlatButton(child: Text("write from file"),
          onPressed: (){
            writeCounter(10);
          },),
          FlatButton(child: Text("back to first screen"),
          onPressed: (){
            Navigator.pop(context);
          },)
        ],
      ),
    );
  }

}