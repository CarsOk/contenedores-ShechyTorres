import 'package:ejercicio1/models/2comment_model.dart';
import 'package:flutter/material.dart';

import 'barra_menu/1posteos.dart';
import 'barra_menu/2comentariosBackend.dart';
import 'barra_menu/3misComentarios.dart';
import 'barra_menu/4fotosPerfil.dart';
import 'barra_menu/5galeria.dart';
import 'barra_menu/6listaComentarios.dart';
//import 'barra_menu/62comentarioPosteado.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('ShechyTorres'), 
            accountEmail: Text('shechytorres@gmail.com'),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage('https://i.pinimg.com/originals/c1/ef/68/c1ef68a0572d8df829a7e5541015f06a.jpg'),
            fit: BoxFit.cover),
          )),
          Ink(
            color: Colors.purple.shade300,
            child: ListTile(
              title: Text('Posteos', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.post_add, color: Colors.pink),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Posteos()
                  )
                );
              },
            ),
          ),
          ListTile(
            title: Text('Comentarios Backend'),
            leading: Icon(Icons.comment, color: Colors.blue),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ComentariosBackend()
                )
              );
            },
          ),
          ListTile(
            title: Text('Mis Comentarios'),
            leading: Icon(Icons.comment_outlined, color: Colors.blue),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => MisComentarios()
                )
              );
            },
          ),
          ListTile(
            title: Text('Fotos Perfil/Comentario'),
            leading: Icon(Icons.photo_album, color: Colors.red),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FotosPerfil()
                )
              );
            },
          ),
          ListTile(
            title: Text('Galeria'),
            leading: Icon(Icons.photo_album_outlined, color: Colors.red),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Galeria()
                )
              );
            },
          ),
          ListTile(
            title: Text('Post Formulario'),
            leading: Icon(Icons.post_add, color: Colors.green),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ListaComentarios()),
              );
            },
          ),
          /* ListTile(
            title: Text('Comentario Posteado'),
            leading: Icon(Icons.post_add, color: Colors.greenAccent),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ComentarioPosteado()
                )
              );
            },
          ), */
        ]
      )
    );
  }
}