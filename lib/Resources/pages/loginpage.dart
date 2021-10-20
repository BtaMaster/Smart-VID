import 'package:flutter/material.dart';

//Login widget
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.height / 16,
                MediaQuery.of(context).size.width / 5,
                0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/logo.jpg'),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                const Center(
                  child: TextField(
                    //FocusScope.of(context).requestFocus(new FocusNode()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                    cursorColor: Colors.white,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding:
                          EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                      hintText: 'USUARIO',
                      hintStyle:
                          TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                const Center(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white),
                    cursorColor: Colors.white,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding:
                          EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
                      hintText: 'CONTRASEÑA',
                      hintStyle:
                          TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  //vacio, espacio de separación:
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {},
                    child: const Text('Enabled'),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
