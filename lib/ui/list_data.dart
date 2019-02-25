import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/post.dart';
import './list_view_posts.dart';

// https://jsonplaceholder.typicode.com/
// https://jwt.io/

class ListData extends StatelessWidget {
  Future<List<Post>> loadPost() async {
    Response resp = await get('https://jsonplaceholder.typicode.com/posts');
    List<dynamic> data = json.decode(resp.body);
    List<Post> posts = List();
    data.forEach((d) {
      posts.add(Post.fromJson(d));
    });
    print(posts.length);
    print(posts.elementAt(0).title);
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data'),
      ),
      body: FutureBuilder(
        future: loadPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListViewPost(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}