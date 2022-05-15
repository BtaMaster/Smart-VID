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
  var isEnabled = false;
  var name = '';
  var pfpUrl =
      'https://smartvid-storage01535-staging.s3.us-east-1.amazonaws.com/public/profiletemp.png?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQC%2BVmOYqQ1EewDvk7JKX3rGV8qKzop%2FqNOPKPDdtOQmGQIhALFxSKOqz%2FxLPFlqptemorWwwRsTMuqUaCJe88yMrsoRKu0CCJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMDY3NTIwODgwMDEzIgy0rlnFlvMxJNgkatYqwQKPkONSzCnWtXJ55QnKZgWpXwND%2Bn0mF6TnTJngzz6IDVgB0q8wg5tufosxi7bxYYKpkVcaFAo%2FRq6UMkUR12NHYqHPFQRQsuRZXw5n0YXD%2FKB77bs5X529W1p4DZgUa688Gx3BoCF%2Fo5ZF%2Bnkog6iVNUO7DCaefj%2BpQNJ6CeAJ%2FCtffoDGqg08rbkk3Dnu%2BTBjV25GYLbtnSZV%2B9ygZDPb9C9eE3UsFA5DA6lKWOSkDucwaux8vI2ECJEsLdOJTyD%2Fu0Wp7mzSCagjcjhPyiiQAFmuEPYWsigvGRdQ0zHuPvEWYQZPykJWemLsZq3psTXyyuOa0sAxvBT5YrgfTy6TT0H3vw7eGl%2BXRgEBo7%2FDVwnj9LrcYT5BzVPoJfVOTDK3zxPvIKk7YrsUEcBvYWUCm4OTLa35eDVqX1q1crhazG0w75WFlAY6sgIImKyUAX19QBsx7obv2OH9itbbC3REXev%2BuI%2F%2F8ykqCPyZl2%2BjzTwi2sEixQ1%2Fwif8OLhseawwshf0R7TLVlyUVTelonHhIp9MhQj158lj%2BFLsH5YkfLt%2FI64Gfz7vGl04LFjc1%2Fz011bUz0CYKETFpwN9Wf97Ajvec65cIfnR1R8en4GZeWfZMtakteXvaJSX7zMjx4UkO%2B88w8cTPfzQMhwNtpw0BtkrvCGIEn9%2F9s%2BwNnAvv4ltMBVIFW3Al28iLsDwE%2Bxu6YCF9oYPcU25uVvnTyEpQBLZQn6TXVtsLAeomDxneEgErwVZPgERx%2FNlUiMqgi2jH2y2S54p%2Bt3CKnb4c6%2BrBtGaRSyqWRnI1TvkBHkczivlD2D0undsaVdDfz1VK5Pe7TFVxliZr3VeoMM%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220515T191401Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ7OEO3WGXPPNEIVO%2F20220515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ffe3e11b766606865ec247cfccbc2a02a2fc806a49601ec97bdac0df21cb43a';

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
                            CircleAvatar(
                              backgroundColor:
                                  HexColor.getColorfromHex(profileIconColor),
                              radius: 75,
                              backgroundImage: NetworkImage(pfpUrl),
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
                                  setState(() {
                                    isEnabled = false;
                                    cognitoRepository
                                        .updateName(nameController.text);
                                    cognitoRepository.updatePassword(
                                        oldpasswordController.text,
                                        passwordController.text);
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
