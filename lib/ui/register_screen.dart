import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }

}

class RegisterScreenState extends State<RegisterScreen>{
  @override
  final _formkey =GlobalKey<FormState>();
  FirebaseAuth auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register new user"),
      ),
      body: Padding(padding: EdgeInsets.all(18),
        child: Form(
          key:_formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value){
                  if (value.isEmpty && value.length < 8) return "Password is required";
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Re Password"),
                obscureText: true,
                validator: (value){
                  if (value.isEmpty && value.length < 8) return "Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Register"),
                        onPressed: (){
                          auth
                          .createUserWithEmailAndPassword(
                            email: "x@x.com", password: "12345678")
                          .then((FirebaseUser user){
                            user.sendEmailVerification();
                            print("return from firebase ${user.email}");
                          }).catchError((error) {
                            print("$error");
                          });
                        },
                    ),
                  )
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }

}