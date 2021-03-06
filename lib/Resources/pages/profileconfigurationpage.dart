import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartvid/Resources/pages/confirmaccountpage.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/pages/resetpasswordpage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/aws_cognito.dart';
import '../classes/aws_storage.dart';
import '../classes/credentialsValidator.dart';
import 'loginpage.dart';

final cognitoRepository = AWSCognitoRepository();
final credentialValidator = CredentialValidator();
final s3Repository = AWSStorageRepository();

//Login widget
class ProfileConfigurationPage extends StatefulWidget {
  const ProfileConfigurationPage({Key? key}) : super(key: key);
  @override
  _ProfileConfigurationState createState() => _ProfileConfigurationState();
}

class _ProfileConfigurationState extends State<ProfileConfigurationPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final oldNameController = TextEditingController();
  final passwordController = TextEditingController();
  final oldpasswordController = TextEditingController();
  final emailConfirmationController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  var isEnabled = false;
  var name = '';
  var pfpUrl = '';

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Borrar Cuenta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('¿Estas seguro que quieres borrar tu cuenta?.'),
                const Text('Esta acción no es reversible.'),
                const Spacer(flex: 1),
                Flexible(
                    flex: 1,
                    child: Center(
                      child: TextFormField(
                        //FocusScope.of(context).requestFocus(new FocusNode()),
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 15.0,
                        ),
                        cursorColor: Colors.white,
                        controller: emailConfirmationController,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          contentPadding: EdgeInsets.only(
                              bottom: 5.0, left: 5.0, right: 5.0),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.purple),
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
                          color: Colors.purple,
                          fontSize: 15.0,
                        ),
                        cursorColor: Colors.white,
                        controller: passwordConfirmationController,
                        obscureText: true,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          contentPadding: EdgeInsets.only(
                              bottom: 5.0, left: 5.0, right: 5.0),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.purple),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Confirm'),
                    onPressed: () async {
                      if (emailConfirmationController.text == emailController.text &&
                          credentialValidator.validatePassword(
                              passwordConfirmationController.text)) {
                        var succesful;
                        await cognitoRepository
                            .deleteAccount(passwordConfirmationController.text).then((value) => succesful = value);
                        Navigator.of(context).pop();
                        if (succesful) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Wrong password.");
                        }
                      }
                      else {
                        Fluttertoast.showToast(msg: "Wrong email or password.");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void initState() {
    super.initState();
    cognitoRepository.getUser().then((value) => setState(() {
          emailController.text = value!;
          print(name);
        }));
    cognitoRepository.getName().then((value) => setState(() {
          name = value;
          nameController.text = value;
          print(name);
        }));
    s3Repository.getPfpUrl().then((value) => setState(() {
          pfpUrl = value!;
          print(pfpUrl);
        }));
  }

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
                    GestureDetector(
                        onTap: () async {
                          await s3Repository
                              .uploadImage()
                              .then((succesful) async => {
                                    if (succesful)
                                      {
                                        print("GETTING PFP URL"),
                                        await s3Repository
                                            .getPfpUrl()
                                            .then((value) => setState(() {
                                                  pfpUrl = value!;
                                                  print(pfpUrl);
                                                }))
                                      }
                                    else
                                      {print("No file uploaded")}
                                  });
                        },
                        child: Stack(
                          children: [
                            pfpUrl != ''
                                ? CircleAvatar(
                                    backgroundColor: HexColor.getColorfromHex(
                                        profileIconColor),
                                    radius: 75,
                                    backgroundImage: NetworkImage(pfpUrl),
                                  )
                                : CircleAvatar(
                                    backgroundColor: HexColor.getColorfromHex(
                                        profileIconColor),
                                    radius: 75,
                                    child: const Image(
                                        image: AssetImage(
                                            "assets/images/profiletemp.png")),
                                  ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.add_a_photo,
                                      color: Colors.black),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        50,
                                      ),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 4),
                                        color: Colors.black.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 3,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )),
                    const Spacer(flex: 1),
                    const Center(
                        child: Text(
                      'Perfil de Usuario',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    )),
                    const Spacer(flex: 1),
                    Flexible(
                        flex: 1,
                        child: Center(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            enabled: false,
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
                    const Spacer(flex: 1),
                    Flexible(
                        flex: 1,
                        child: Center(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            controller: nameController,
                            enabled: isEnabled,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              contentPadding: EdgeInsets.only(
                                  bottom: 5.0, left: 5.0, right: 5.0),
                              labelText: 'Nombres',
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
                              fontSize: 20.0,
                            ),
                            cursorColor: Colors.white,
                            controller: oldpasswordController,
                            enabled: isEnabled,
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
                    isEnabled
                        ? Flexible(
                            flex: 1,
                            child: Center(
                              child: TextFormField(
                                //FocusScope.of(context).requestFocus(new FocusNode()),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                cursorColor: Colors.white,
                                controller: passwordController,
                                enabled: isEnabled,
                                obscureText: true,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  contentPadding: EdgeInsets.only(
                                      bottom: 5.0, left: 5.0, right: 5.0),
                                  labelText: 'Nueva Contraseña',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                        : SizedBox(),
                    const Spacer(flex: 1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                          primary: HexColor.getColorfromHex(calendarColor),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)),
                      onPressed: () {
                        showMyDialog();
                      },
                      child: const Text('Borrar Cuenta'),
                    ),
                    const Spacer(flex: 1),
                    Center(
                        child: Row(
                      children: [
                        isEnabled
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                    primary:
                                        HexColor.getColorfromHex(calendarColor),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15)),
                                onPressed: () {
                                  setState(() {
                                    isEnabled = false;
                                    nameController.text =
                                        oldNameController.text;
                                  });
                                },
                                child: const Text('Cancel'),
                              )
                            : SizedBox(),
                        const Spacer(flex: 1),
                        isEnabled
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                    primary:
                                        HexColor.getColorfromHex(calendarColor),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15)),
                                onPressed: () {
                                  setState(() async {
                                    if (credentialValidator.validatePassword(
                                            passwordController.text) &&
                                        nameController.text != '') {
                                      isEnabled = false;
                                      cognitoRepository
                                          .updateName(nameController.text);
                                      cognitoRepository.updatePassword(
                                          oldpasswordController.text,
                                          passwordController.text);
                                    } else {}
                                  });
                                },
                                child: const Text('Confirm'),
                              )
                            : SizedBox(),
                        const Spacer(flex: 1),
                        !isEnabled
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                    primary:
                                        HexColor.getColorfromHex(calendarColor),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15)),
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('Back'),
                              )
                            : SizedBox(),
                        const Spacer(flex: 1),
                        !isEnabled
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                    primary:
                                        HexColor.getColorfromHex(calendarColor),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15)),
                                onPressed: () {
                                  setState(() {
                                    oldNameController.text =
                                        nameController.text;
                                    isEnabled = true;
                                  });
                                },
                                child: const Text('Edit'),
                              )
                            : SizedBox(),
                        const Spacer(flex: 1),
                      ],
                    )),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
