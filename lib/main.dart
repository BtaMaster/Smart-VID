import 'package:flutter/material.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/pages/routerpage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';

void main() => runApp(MaterialApp(
    title: "Smart VID",
    home: const MyApp(),
    theme: ThemeData(primarySwatch: HexColor.getMaterialColor(headColor))));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Smart VID')),
        body: ListView(children: <Widget>[
          ListTile(
            title: const Text('Router Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RouterPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Login Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Register Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ]));
  }
}
