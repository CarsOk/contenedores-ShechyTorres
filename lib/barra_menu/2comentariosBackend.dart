import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//borra esto

import 'package:ejercicio1/models/2comment_model.dart';

class ComentariosBackend extends StatelessWidget {
  const ComentariosBackend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comentarios')),
      body: FutureBuilder<List<Comment>>(
        future: getComment(),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Comment> comentarios = snapshot.data;
            return listaComentarios(comentarios);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView listaComentarios(List<Comment> comentarios) {
    return ListView.builder(
            itemCount: comentarios.length,
            itemBuilder: (BuildContext context, int index) {
              Comment comment = comentarios[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(comment.email),
                    leading: Icon(Icons.email),
                    subtitle: Text(comment.name),
                  ),
                  Divider()
                ],
              );
            },
          );
  }

  Future<List<Comment>> getComment() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return commentFromJson(respuesta.body);
    } else {
      return null;
    }
  }
}
