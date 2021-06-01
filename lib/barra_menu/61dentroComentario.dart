import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ejercicio1/models/2comment_model.dart';

class DentroComentario extends StatelessWidget {
  //const DentroComentario({Key key}) : super(key: key);
  final Comment comment;
  DentroComentario(this.comment);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final respuesta = await borrarComentario(comment.id);
                if (respuesta) {
                  print('Borrado Correctamente');
                  Navigator.pop(context);
                } else {
                  print('Error al Borrar');
                }
              })
        ],
        title: Text('Información del Comentario',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Id del Usuario',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.perm_identity,
              color: Colors.black,
            ),
            subtitle: Text(
              comment.postId.toString(), style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Nombre del Usuario',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            subtitle: Text(
              comment.name,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Correo del Usuario',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.email,
              color: Colors.black,
            ),
            subtitle: Text(
              comment.email,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Comentario del Usuario',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.comment_outlined,
              color: Colors.black,
            ),
            subtitle: Text(
              comment.body,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> borrarComentario(int id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments/$id');
    final respuesta =await http.delete(url);
    print('Response status: ${respuesta.statusCode}');
    if (respuesta.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
