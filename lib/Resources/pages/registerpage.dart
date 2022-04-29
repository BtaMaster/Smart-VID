import 'package:flutter/material.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/Resources/util/colors.dart';

import '../classes/aws_cognito.dart';

final cognitoRepository = AWSCognitoRepository();

//Login widget
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController();
  var errorNombres = '';
  var emailControler = TextEditingController();
  var errorCorreo = '';
  var passwordController = TextEditingController();
  var errorContrasenia = '';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(
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
                      'Registrarse',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    )),
                    const Spacer(flex: 2),
                    Flexible(
                        flex: 2,
                        child: Center(
                          child: TextFormField(
                            controller: nameController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            autocorrect: false,
                            decoration: InputDecoration(
                              errorText:
                                  errorNombres.isNotEmpty ? errorNombres : null,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: const EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Nombres',
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    const Spacer(flex: 1),
                    Flexible(
                        flex: 2,
                        child: Center(
                          child: TextFormField(
                            controller: emailControler,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            autocorrect: false,
                            decoration: InputDecoration(
                              errorText:
                                  errorCorreo.isNotEmpty ? errorCorreo : null,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: const EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Correo Electrónico',
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    const Spacer(flex: 1),
                    Flexible(
                        flex: 2,
                        child: Center(
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            obscureText: true,
                            autocorrect: false,
                            decoration: InputDecoration(
                              errorText: errorContrasenia.isNotEmpty
                                  ? errorContrasenia
                                  : null,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: const EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Contraseña',
                              labelStyle: const TextStyle(color: Colors.white),
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
                      onPressed: () async {
                        //Aquí iría la validación de los campos:
                        if (nameController.text.isEmpty) {
                          errorNombres = 'Campo vacío';
                        } else {
                          await cognitoRepository.signup(emailControler.text,
                              passwordController.text, nameController.text);
                          await cognitoRepository.login(
                              emailControler.text, passwordController.text);
                          var loggedIn;
                          await cognitoRepository
                              .isLoggedIn()
                              .then((value) => {loggedIn = value});
                          if (loggedIn == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {}
                        }
                      },
                      child: const Text('Crear Cuenta'),
                    )),
                    const Spacer(flex: 1),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 10)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text('Inicio de Sesión'),
                      ),
                    ),
                    const Spacer(flex: 1)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
