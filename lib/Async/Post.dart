import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.title, this.id, this.body, this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class AsyncPost extends StatelessWidget {
  final Future<Post> post;

  AsyncPost({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Async Fetch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // default
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
