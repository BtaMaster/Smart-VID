import 'package:flutter/material.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/aws_cognito.dart';

final cognitoRepository = AWSCognitoRepository();

//Login widget
class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<ConfirmationPage> {
  final emailController = TextEditingController(text: cognitoRepository.getUsername());
  final codeController = TextEditingController();
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
                      'Confirma tu cuenta',
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
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            controller: emailController,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    const Spacer(flex: 2),
                    Flexible(
                        flex: 1,
                        child: Center(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            controller: codeController,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Código de confirmación',
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
                      onPressed: () async {
                        var succesfull;
                        await cognitoRepository
                            .confirmAccount(
                                emailController.text, codeController.text)
                            .then((value) => {succesfull = value});
                        if (succesfull) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {}
                      },
                      child: const Text('Confirmar'),
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
                    const Spacer(flex: 1),
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
                        child: const Text('Volver a login'),
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