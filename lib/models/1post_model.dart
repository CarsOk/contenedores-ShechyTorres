import 'dart:convert';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post.fromJson(String json){
    Map mapa = jsonDecode(json);
    this.userId = mapa['userId'];
    this.id = mapa['id'];
    this.title = mapa['title'];
    this.body = mapa['body'];
  }

}