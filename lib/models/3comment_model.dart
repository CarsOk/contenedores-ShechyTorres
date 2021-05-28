// To parse this JSON data, do
//
//     final comentario = comentarioFromJson(jsonString);

import 'dart:convert';

Comment comentarFromJson(String str) => Comment.fromJson(json.decode(str));

String comentarToJson(Comment data) => json.encode((data.toJson()));

class Comment {
    Comment({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    String postId;
    String id;
    String name;
    String email;
    String body;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postId: json["postId"],
        id: json["id"].toString(),
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}