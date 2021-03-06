import 'package:ejercicio1/barra_menu/61dentroComentario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:ejercicio1/models/2comment_model.dart';
import 'package:ejercicio1/barra_menu/62formulario.dart';

class ListaComentarios extends StatefulWidget {
  ListaComentarios({Key key}) : super(key: key);
  /* final Comment comment;
  ListaComentarios(this.comment); */

  @override
  _ListaComentariosState createState() => _ListaComentariosState();
}

class _ListaComentariosState extends State<ListaComentarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Comentarios',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.plus_one,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Formulario()));
        },
      ),
      body: FutureBuilder<List<Comment>>(
        future: obtenerComentarios(),
        builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Comment> comentarios = snapshot.data;

            return construirListaComentarios(comentarios);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView construirListaComentarios(List<Comment> comentarios) {
    return ListView.builder(
      itemCount: comentarios.length,
      itemBuilder: (BuildContext context, int index) {
        Comment comment = comentarios[index];
        return Column(
          children: [
            ListTile(
              title: Text(
                comment.email,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(Icons.email, color: Colors.black),
              subtitle: Text(comment.id.toString()),
              minLeadingWidth: 30.0,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward, color: Colors.black),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DentroComentario(comment),
                ));
              },
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

Future<List<Comment>> obtenerComentarios() async {
  final url = Uri.parse('https://carsok.github.io/contenedores-ShechyTorres/comments');
  final respuesta = await http.get(url);

  if (respuesta.statusCode == 200) {
    return commentFromJson(respuesta.body);
  } else {
    return null;
  }
}