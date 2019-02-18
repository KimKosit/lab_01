import 'dart:io';

import 'package:flutter/material.dart';
// import 'detail_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }
  
}

class FirstScreenState extends State<FirstScreen>{
  List<String> _passengers = <String>["", "1", "2", "3", "4", "5"];
  File _image;

  Future getImage() async{
    var image =await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
     _image = image; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick imnage',
        child: new Icon(Icons.add_a_photo),
      ),
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Column(
         children: <Widget>[
           _image == null ? Text("No images selected."): Image.file(_image),
          InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Passenger',
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: _passengers.map((String value) {
                  return DropdownMenuItem(
                    value:value,
                    child: Text(value), 
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                  });
                },
              ),
            ),
          ),
          DateTimePickerFormField(
            inputType: InputType.date,
            format: DateFormat("yyyy-MM-dd"),
            decoration: InputDecoration(labelText: "Date"),
          )
        ],
      ),
    );
  }

}