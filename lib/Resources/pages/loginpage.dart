import 'package:flutter/material.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/aws_cognito.dart';

final awsCognito = AWSCognitoRepository();

//Login widget
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.height / 16,
                MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.width / 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(flex: 1),
                const Center(
                    child: Text(
                  'Inicio de sesión',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                )),
                const Spacer(flex: 2),
                Flexible(
                    flex: 1,
                    child: Center(
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        cursorColor: Colors.white,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              bottom: 5.0, left: 5.0, right: 5.0),
                          labelText: 'Correo Electrónico',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                const Spacer(flex: 1),
                Flexible(
                    flex: 1,
                    child: Center(
                      child: TextFormField(
                        controller: passwordController,
                        //FocusScope.of(context).requestFocus(new FocusNode()),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        cursorColor: Colors.white,
                        obscureText: true,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              bottom: 5.0, left: 5.0, right: 5.0),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                const Spacer(flex: 1),
                Center(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      primary: HexColor.getColorfromHex(calendarColor),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                  onPressed: () {
                    awsCognito.login(
                        emailController.text, passwordController.text);
                  },
                  child: const Text('Iniciar Sesión'),
                )),
                const Spacer(flex: 1),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 10)),
                    onPressed: () {},
                    child: const Text('¿Olvidaste la contraseña?'),
                  ),
                ),
                const Spacer(flex: 1)
              ],
            ),
          ),
        )
      ],
    );
  }
}
