import 'package:flutter/material.dart';
import 'menu_lateral.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp', 
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SENA', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w400))),
        drawer: MenuLateral(),
        body: Center(
        child: Column(
          children: [
            Text('Bienvenido a la App SENA',
              style: TextStyle(color: Colors.red, fontSize: 35.0), textAlign: TextAlign.center),
            Image(
              image: NetworkImage('https://lostramites.com.co/wp-content/uploads/logo-sena-fondo-naranja-300x300.jpg'),
              height: 200,
              width: 200,
            ),
              SizedBox(
                height: 30.0,
              ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/facebook-icon.png',
                  height: 30.0,
                ),
                  SizedBox(
                    width: 30.0,
                  ),
                Image.asset(
                  'assets/instagram-icon.png',
                  height: 30.0,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}