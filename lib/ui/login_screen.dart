import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen>{
  final _formkey =GlobalKey<FormState>();

  FirebaseAuth auth =FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(18),
        child: Form(
          key:_formkey,
          child: Column(
            children: <Widget>[
              Image.asset("resources/Koala.jpg", height: 200,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if (value.isEmpty) return "Email is required";
                },
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value){
                  if (value.isEmpty) return "Password is required";
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Sign in"),
                        onPressed: (){
                          auth.signInWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          ).then((FirebaseUser user) {
                            if (user.isEmailVerified){
                              print("Go to home screen");
                            }else{
                              print("Please verify your email");
                            }
                          });
                        },
                    ),
                  )
                ]
              ),
              FlatButton(child: Text("Register new user"),
              onPressed: (){
                Navigator.pushNamed(context, "/register");
              },)
            ],
          ),
        ),
      ),
    );
  }

}