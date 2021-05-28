import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//borra esto

import 'package:ejercicio1/models/3photos_model.dart';


class FotosPerfil extends StatelessWidget {
  const FotosPerfil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fotos Perfil/Comentario')),
      body: FutureBuilder(
        future: getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Photos> fotos = snapshot.data;
            return listaPhotos(fotos);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView listaPhotos(List<Photos> fotos) {
    return ListView.builder(
      itemCount: fotos.length,
      itemBuilder: (BuildContext context, int index) {
        Photos photos = fotos[index];
      return Column(
        children: [
          ListTile(
            title: Text(photos.title),
            leading: CircleAvatar(child: Image.network(photos.url)),
          ),
        ],
      );
     },
    );
  }

  Future<List<Photos>> getPhotos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      return photosFromJson(respuesta.body);
    } else {
      return null;
    }
  }
}