import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewPost extends StatelessWidget {
  List<Post> posts;

  ListViewPost({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.all(15.0),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(this.posts.elementAt(index).title),
                subtitle: Text(this.posts.elementAt(index).body),
                onTap: () {
                  print("tab on ${this.posts.elementAt(index).id}");
                },
              )
            ],
          );
        },
      ),
    );
  }
}