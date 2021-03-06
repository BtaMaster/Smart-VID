import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartvid/Resources/pages/confirmaccountpage.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/pages/resetpasswordpage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/aws_cognito.dart';
import '../classes/credentialsValidator.dart';

final cognitoRepository = AWSCognitoRepository();
final credentialValidator = CredentialValidator();

//Login widget
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emaillController = TextEditingController();
  final passwordController = TextEditingController();
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
                    const Center(
                        child: Text(
                      'Inicio de sesión',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    )),
                    const Spacer(flex: 1),
                    Flexible(
                        flex: 1,
                        child: Center(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            cursorColor: Colors.white,
                            controller: emaillController,
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
                            //FocusScope.of(context).requestFocus(new FocusNode()),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            cursorColor: Colors.white,
                            controller: passwordController,
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
                              horizontal: 20, vertical: 15)),
                      onPressed: () async {
                        if (credentialValidator.validateLogin(
                            emaillController.text, passwordController.text)) {
                          await cognitoRepository.login(
                              emaillController.text, passwordController.text);
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
                        } else {
                          Fluttertoast.showToast(msg: "Invalid credentials.");
                        }
                      },
                      child: const Text('Iniciar Sesión'),
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
                                builder: (context) => const ResetPasswordPage()),
                          );
                        },
                        child: const Text('¿Olvidaste la contraseña?'),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 10)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text('Crear Cuenta'),
                      ),
                    ),
                    
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 10)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ConfirmationPage()),
                          );
                        },
                        child: const Text('Confirmar Cuenta'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
