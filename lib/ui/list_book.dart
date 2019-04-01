import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          // create list component
          return ListView.builder(
            itemCount: snapshot.data.size(),
            itemBuilder: (context, index){
              return ListTile(
                title: snapshot.data[index]['title'],
                subtitle: snapshot.data[index]['subtitle'],
              );
            },
          );
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
  
}

