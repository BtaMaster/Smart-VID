import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
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
import 'package:smartvid/Resources/pages/notificacionespage.dart';
import 'package:smartvid/Resources/pages/registerpage.dart';
import 'package:smartvid/Resources/pages/temperaturadelsuelopage.dart';
import 'package:smartvid/Resources/pages/temperaturarelativapage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/pages/routerpage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:latlong2/latlong.dart';
import 'package:smartvid/amplifyconfiguration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Amplify.addPlugins([AmplifyAuthCognito()]);
  await Amplify.configure(amplifyconfig);
  runApp(MaterialApp(
      title: "Smart VID",
      home: const MyApp(),
      theme: ThemeData(primarySwatch: HexColor.getMaterialColor(headColor))));
}

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
          ListTile(
            title: const Text('Monitoreo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MonitoreoPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Temperatura Relativa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TemperaturaRelativaPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Humedad Relativa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HumedadRelativaPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Temperatura del Suelo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TemperaturaDelSueloPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Humedad del Suelo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HumedadDelSueloPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Luminosidad'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LuminosidadPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Dispositivos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DispositivosPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Mapa'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MapaPage(
                        point: LatLng(-13, -72),
                        nombre: "Controlador de ejemplo")),
              );
            },
          ),
          ListTile(
            title: const Text('Notificaciones'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificacionesPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Calendario'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarioPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Calendario vegetativo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalendarioDetallePage(
                          tipoCalendario: "VEGETATIVO",
                          fase1: FaseReposoInvernal(
                              diasTranscurridos: 39, diasFaltantes: 51),
                          fase2: FaseLloros(
                              diasTranscurridos: 9, diasFaltantes: 21),
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Calendario reproductivo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CalendarioDetallePage(
                          tipoCalendario: "REPRODUCTIVO",
                          fase1: FaseCrecimientoDeOrganos(
                              diasTranscurridos: 39, diasFaltantes: 51),
                          fase2: FaseBrotamiento(
                              diasTranscurridos: 9, diasFaltantes: 21),
                        )),
              );
            },
          ),
        ]));
  }
}
