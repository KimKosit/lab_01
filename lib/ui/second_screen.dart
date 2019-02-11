import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("back to first Screen"), 
            onPressed: () {
              Navigator.pop(context);
        },
      ),
      ),
    );
  }

}