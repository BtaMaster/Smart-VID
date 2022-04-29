import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/classes/fases.dart';
import 'package:smartvid/Resources/pages/calendariopage.dart';
import 'package:smartvid/Resources/pages/calendariodetallepage.dart';
import 'package:smartvid/Resources/pages/dispositivospage.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/pages/humedaddelsuelo.dart';
import 'package:smartvid/Resources/pages/humedadrelativapage.dart';
import 'package:smartvid/Resources/pages/luminosidadpage.dart';
import 'package:smartvid/Resources/pages/mapapage.dart';
import 'package:smartvid/Resources/pages/monitoreopage.dart';
import 'package:smartvid/Resources/pages/notificaciondetallepage.dart';
import 'package:smartvid/Resources/pages/notificacionespage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/pages/temperaturadelsuelopage.dart';
import 'package:smartvid/Resources/pages/temperaturarelativapage.dart';
import 'package:smartvid/Resources/provider/push_notifications_provider.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/pages/routerpage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:latlong2/latlong.dart';
import 'package:smartvid/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';

import 'models/ModelProvider.dart';

final cognitoRepository = AWSCognitoRepository();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance)
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
