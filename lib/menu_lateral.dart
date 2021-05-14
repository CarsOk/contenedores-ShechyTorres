import 'package:flutter/material.dart';
import 'barra_menu/menu_1.dart';
import 'barra_menu/menu_2.dart';
import 'barra_menu/menu_3.dart';
import 'barra_menu/menu_4.dart';


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
            color: Colors.deepOrangeAccent,
            child: ListTile(
              title: Text('Menu 1', style: TextStyle(color: Colors.white)),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Menu1()
                  )
                );
              },
            ),
          ),
          ListTile(
            title: Text('Menu 2'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Menu2()
                )
              );
            },
          ),
          ListTile(
            title: Text('Menu 3'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Menu3()
                )
              );
            },
          ),
          ListTile(
            title: Text('Menu 4'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Menu4()
                )
              );
            },
          ),
        ]
      )
    );
  }
}