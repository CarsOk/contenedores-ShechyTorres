import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//borra esto

import 'package:ejercicio1/models/2comment_model.dart';


class MisComentarios extends StatelessWidget {
  const MisComentarios({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Comentarios')),
      body: FutureBuilder<List<Comment>>(
        future: getMyComment(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Comment> misComentarios = snapshot.data;

            return listaMisComentarios(misComentarios);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView listaMisComentarios(List<Comment> misComentarios) {
    return ListView.builder(
      itemCount: misComentarios.length,
      itemBuilder: (BuildContext context, int index) {
        Comment comment = misComentarios[index];
      return Column(
        children: [
          ListTile(
            title: Text(comment.email),
            leading: Icon(Icons.email),
            subtitle: Text(comment.body),
          ),
          Divider()
        ],
      );
     },
    );
  }

  Future<List<Comment>> getMyComment() async {
    final url = Uri.parse('https://raw.githubusercontent.com/ShechyTorres/practiceAPI/main/comment.json');
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return commentFromJson(respuesta.body);
    } else
    return null;
  }
}