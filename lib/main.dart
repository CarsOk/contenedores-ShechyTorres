import 'package:flutter/material.dart';

void main() => runApp(MyApp('Mi Proyecto'))

class MyApp extends StatelessWidget{
  String titulo;
  MyApp(String titulo);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.titulo, 
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppProyect', 
        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w400))),
      body: Center(
        child: Column(
          children: [
            Text('Bienvenido a la AppProyect', style: TextStyle(color: Colors.red)),
            Text('En este programa crearemos la AppProyect',
              style: TextStyle(color: Colors.green, fontSize: 30.0, fontStyle: FontStyle.italic)),
            Row(children: [
              Icon(Icons.ac_unit, size: 30.0, color: Colors.lightBlueAccent),
              Icon(Icons.access_alarm, size: 30.0, color: Colors.yellow),
              Icon(Icons.audiotrack, size: 30.0, color: Colors.blue),
              Icon(Icons.favorite, size: 30.0, color: Colors.pink)],
            )
          ],
        )));
  }
}