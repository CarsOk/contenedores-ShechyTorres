import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ejercicio1/models/3comment_model.dart';
import 'package:ejercicio1/barra_menu/63comentarioPosteado.dart';

class Formulario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final comentarios = Comment2(id: '1');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              Text(
                'Digitar Información',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              /* TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'N° Id',
                  border: OutlineInputBorder(),
                ),
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
                autofocus: true,
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
                autofocus: true,
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
                    Comment2 comentario = await registrar(comentarios.toJson());

                    if (comentario != null) {
                      print('Guardado ');
                      Navigator.pop(context);
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
                  child: Text('Guardar')),
            ],
          ),
        ),
      ),
    );
  }

  Future<Comment2> registrar(Map<String, dynamic> datos) async {
    final url = Uri.parse('https://carsok.github.io/contenedores-ShechyTorres//comments');
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
