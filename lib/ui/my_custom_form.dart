import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }

}
 
class MyCustomFormState extends State<MyCustomForm>{

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom form"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Image.asset("resources/Koala.jpg", height: 200,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Please input your email",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value){
                if (value.isEmpty){
                  return "Please enter some text";
                }
              }
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Please input your password",
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
            ),
            RaisedButton(child: Text("Continue"),
            onPressed: (){
              _formkey.currentState.validate();
            },
            )
          ],
        ),
      ),
    );
  }

}