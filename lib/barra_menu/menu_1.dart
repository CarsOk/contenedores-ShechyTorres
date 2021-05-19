import 'package:ejercicio1/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Menu1 extends StatelessWidget {
  const Menu1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu 1')
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Post>(
        future: getInfo(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            Post post = snapshot.data;
            return respuesta(post);
          }
          return Center(child: CircularProgressIndicator());
        },
        )
      ),
    );
  }

Column respuesta(Post post){
  return Column(
    children: [
      ListTile(
        leading: Icon(Icons.person),
        title: Text('userId'),
        subtitle: Text(post.userId.toString()),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('ID'),
        subtitle: Text(post.id.toString()),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.access_alarm),
        title: Text('Titulo'),
        subtitle: Text(post.title),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.account_box),
        title: Text('Contenido'),
        subtitle: Text(post.body),
      )
    ],
  );
}


  Future<Post> getInfo() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final respuesta = await http.get(url);
    
    if (respuesta.statusCode == 200) {
      return new Post.fromJson(respuesta.body);
    } else{
      return null;
    }
  }
}