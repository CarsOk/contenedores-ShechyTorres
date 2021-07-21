// To parse this JSON data, do
//
//     final comentario = comentarioFromJson(jsonString);


import 'dart:convert';

Comment2 comentarFromJson(String str) => Comment2.fromJson(json.decode(str));

String comentarToJson(Comment2 data) => json.encode((data.toJson()));

class Comment2 {
    Comment2({
        //this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    //String postId;
    String id;
    String name;
    String email;
    String body;

    factory Comment2.fromJson(Map<String, dynamic> json) => Comment2(
        //postId: json["postId"],
        id: json["id"].toString(),
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        //"postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}