import 'package:flutter/material.dart';

//import 'package:ejercicio1/barra_menu/6listaComentarios.dart';
import 'package:ejercicio1/models/3comment_model.dart';

// ignore: must_be_immutable
class ComentarioPosteado extends StatefulWidget {
  final Comment2 comment;
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
        title: Text('Comentario',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center),
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
              Icons.person_add_alt,
              color: Colors.black,
            ),
            subtitle: Text(
              widget.comment.id,
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
              widget.comment.name,
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
              widget.comment.email,
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
              widget.comment.body,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          /* ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ListaComentarios(),
                ),
              );
            },
            child: Text('Volver'),
          ), */
        ],
      ),
    );
  }
}
