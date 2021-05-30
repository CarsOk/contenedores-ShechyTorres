import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ejercicio1/models/3comment_model.dart';
import 'package:ejercicio1/barra_menu/62comentarioPosteado.dart';

class PostFormulario extends StatelessWidget {
  const PostFormulario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comentarios = Comment(/* id: '1' */);

    return Scaffold(
      appBar: AppBar(title: Text('Postear Comentario')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              /* TextField(
                keyboardType: TextInputType.number,
                onChanged: (valor) => comentarios.postId = valor,
              ), */
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) => comentarios.name = valor,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) => comentarios.email = valor,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Comentario',
                  border: OutlineInputBorder(),
                ),
                onChanged: (valor) => comentarios.body = valor,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Comment comentario = await registrar(comentarios.toJson());

                    if (comentario != null) {
                      print('Guardado ');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ComentarioPosteado(comentario),
                        ),
                      );
                    } else {
                      print('NO GUARDO');
                      final snackBar = SnackBar(content: Text('PROBLEMAS'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('Guardar'))
            ],
          ),
        ),
      ),
    );
  }

  Future<Comment> registrar(Map<String, dynamic> datos) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final respuesta = await http.post(url, body: datos);
    print('Response status: ${respuesta.statusCode}');
    //print('Response body: ${respuesta.body}');
    if (respuesta.statusCode == 201) {
      return comentarFromJson(respuesta.body);
    } else {
      return null;
    }
  }
}
