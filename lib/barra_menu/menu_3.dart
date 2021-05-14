import 'package:flutter/material.dart';


class Menu3 extends StatelessWidget {
  const Menu3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu 3')),
      body: Center(
        child: Text('Estas en Menu 3'),
      ),
    );
  }
}