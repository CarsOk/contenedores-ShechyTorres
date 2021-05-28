import 'package:flutter/material.dart';

import 'package:ejercicio1/models/3comment_model.dart';


// ignore: must_be_immutable
class ComentarioPosteado extends StatefulWidget {
  Comment comment;
  ComentarioPosteado(this.comment);

  @override
  _ComentarioPosteadoState createState() => _ComentarioPosteadoState();
}

class _ComentarioPosteadoState extends State<ComentarioPosteado> {
  @override
  Widget build(BuildContext context) {
    //var comment;
    return Scaffold(
      appBar: AppBar(
        title: Text('Posteado'),
      ),
      body: Column(
        children: [
          //Text(comment.postId),
          Text(widget.comment.name),
          Text(widget.comment.email),
          Text(widget.comment.body),
        ],
      ),
    );
  }
}
