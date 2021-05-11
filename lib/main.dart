import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp', 
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('AppProyect', 
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400)))),
      body: Center(
        child: Column(
          children: [
            Text('Bienvenido a la AppProyect',
              style: TextStyle(color: Colors.red, fontSize: 35.0, fontStyle: FontStyle.italic)),
            Text('En este programa crearemos la AppProyect',
              style: TextStyle(color: Colors.green, fontSize: 28.0)),
            const Image(
              image: NetworkImage('https://onoffsolutions.com.ar/wp-content/uploads/2020/11/Captura-de-Pantalla-2020-11-26-a-las-17.02.13.png'),
              height: 100,
              width: 200),
            Row(
              children: [
                Icon(Icons.ac_unit, size: 30.0, color: Colors.lightBlueAccent),
                Icon(Icons.access_alarm, size: 30.0, color: Colors.yellow),
                Icon(Icons.audiotrack, size: 30.0, color: Colors.blue),
                Icon(Icons.favorite, size: 30.0, color: Colors.pink),
                Image.asset(
                  'imagen/facebook-icon.png',
                  height: 30.0),
                Image(
                  image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/1025px-Instagram-Icon.png'),
                  height: 30.0),
                Image(
                  image: NetworkImage('https://png.pngtree.com/element_our/md/20180509/md_5af29f0b8bcfc.jpg'),
                  height: 30.0),
              ]),
          ],
        )));
  }
}