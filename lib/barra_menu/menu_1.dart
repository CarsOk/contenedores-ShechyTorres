import 'package:flutter/material.dart';


class Menu1 extends StatelessWidget {
  const Menu1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu 1')),
      body: Center(
        child: Text('Estas en Menu 1'),
      ),
    );
  }
}