import 'dart:ui';
import 'package:flutter/material.dart';
import 'menu_lateral.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TamosRedi', style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w400))),
        drawer: MenuLateral(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red,Colors.pink.shade300,Colors.pink.shade400,Colors.purple,Colors.purple.shade700,Colors.purple.shade800],
              stops: [0.1,0.3,0.5,0.7,0.9,0.7],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
            )
          ),
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Redes Sociales',
                style: TextStyle(color: Colors.white, fontSize: 45.0), textAlign: TextAlign.center),
              Text('Bienvenido a las redes sociales', 
              style: TextStyle(color: Colors.pink.shade100, fontSize: 30.0),
              textAlign: TextAlign.center,
              ),
              Image(
                image: NetworkImage('https://img.icons8.com/dusk/512/social-network.png'),
                height: 200,
                width: 200,
              ),
                SizedBox(
                  height: 30.0,
                ),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage('https://fatimamartinez.es/wp-content/uploads/2020/06/Logo-TikTok.png'),
                    width: 30.0,
                  ),
                    SizedBox(
                      width: 30.0,
                    ),
                  Image(
                    image: NetworkImage('https://bienaldemusicaisabelina.files.wordpress.com/2015/04/fb.png'),
                    width: 30.0,
                  ),
                    SizedBox(
                      width: 30.0,
                    ),
                  Image(
                    image: NetworkImage('http://assets.stickpng.com/images/580b57fcd9996e24bc43c521.png'),
                    width: 30.0,
                  ),
                    SizedBox(
                      width: 30.0,
                    ),
                  Image(
                    image: NetworkImage('https://i.pinimg.com/originals/66/5e/94/665e94035ee1789a878884a56f04ca4c.png'),
                    width: 30.0,
                  ),
                ],
              ),
            ],
          ))
        ),
    );
  }
}