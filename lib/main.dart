import 'package:flutter/material.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/pages/routerpage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
void main() => runApp(MaterialApp(
  title: "Smart VID", 
  home: MyApp(), 
  theme: ThemeData(primarySwatch: HexColor.getMaterialColor(headColor)))
  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Smart VID')),
        body: ListView(children: <Widget>[
          ListTile(
            title: Text('Router Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RouterPage()),
              );
            },
          ),
          ListTile(
            title: Text('Login Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ]));
  }
}

