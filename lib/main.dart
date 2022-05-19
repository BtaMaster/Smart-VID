import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'models/ModelProvider.dart';


final cognitoRepository = AWSCognitoRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance),
    AmplifyStorageS3()
  ]);
  await Amplify.configure(amplifyconfig);
  var loggedIn = false;
  await cognitoRepository.isLoggedIn().then((value) => loggedIn = value);
  //await cognitoRepository.Test();
  runApp(MaterialApp(
      title: "Smart VID",
      home: MyApp(loggedIn),
      theme: ThemeData(primarySwatch: HexColor.getMaterialColor(headColor))));
}
class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  MyApp(this.loggedIn);

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {

    print("Is user logged in?: " + loggedIn.toString());
    if (loggedIn == true) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
