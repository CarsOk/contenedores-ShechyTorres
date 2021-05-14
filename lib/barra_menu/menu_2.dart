import 'package:flutter/material.dart';


class Menu2 extends StatelessWidget {
  const Menu2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu 2')),
      body: Center(
        child: Text('Estas en Menu 2'),
      ),
    );
  }
}