import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/pages/calendariopage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/Resources/pages/reportepage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/notificacion.dart';
import '../provider/push_notifications_provider.dart';
import 'monitoreopage.dart';
import 'notificaciondetallepage.dart';
import 'notificacionespage.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Data: ${message.data.toString()}');
  print('Título de la Notificación: ${message.notification!.title}');
  print('Descripción de la Notificación: ${message.notification!.body}');
}

final cognitoRepository = AWSCognitoRepository();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = '';

  @override
  void initState() {
    super.initState();
    //final messaging = FirebaseMessaging.instance;
    PushNotificationProvider().initNotifications();
    cognitoRepository.getName().then((value) => setState(() {
          name = value;
          print(name);
        }));
    /*
      //Configuración para Apple
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    */
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await Firebase.initializeApp();
      print('Mensaje con aplicación Abierta');
      print('Data del Mensaje: ${message.data}');
      if (message.notification != null) {
        print('Título de Notificacion: ${message.notification!.title}');
        print('Descripcion de Notificacion: ${message.notification!.body}');
      }
    });

    //Notificación cuando la aplicación esta en segundo plano
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    //Ruta de navegación al abrir el mensaje de la notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (message.data != null) {
        switch (message.data['problema']) {
          case 'Humedad Relativa':
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificacionDetallePage(
                    notificacion: NotificacionHumedadRelativa(
                        message.notification!.body.toString(),
                        valorDetectado: message.data['valorDetectado']))));
            break;
          case 'Luminosidad Solar':
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificacionDetallePage(
                    notificacion: NotificacionLuminosidadSolar(
                        message.notification!.body.toString(),
                        valorDetectado: message.data['valorDetectado']))));
            break;
          case 'Temperatura Relativa':
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificacionDetallePage(
                    notificacion: NotificacionTemperaturaRelativa(
                        message.notification!.body.toString(),
                        valorDetectado: message.data['valorDetectado']))));
            break;
          case 'Temperatura Suelo':
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificacionDetallePage(
                    notificacion: NotificacionTemperaturaSuelo(
                        message.notification!.body.toString(),
                        valorDetectado: message.data['valorDetectado']))));
            break;
          case 'Humedad Suelo':
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificacionDetallePage(
                    notificacion: NotificacionHumedadSuelo(
                        message.notification!.body.toString(),
                        valorDetectado: message.data['valorDetectado']))));
            break;
          default:
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificacionesPage()));
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading:
                  false, //para no mostrar el icono de regreso
              toolbarHeight: MediaQuery.of(context).size.height / 5,
              title: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                          image: const AssetImage("assets/images/logo.jpg"),
                          width: MediaQuery.of(context).size.width / 2),
                      Text('Bienvenido(a), ' + name,
                          overflow: TextOverflow.visible),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: HexColor.getColorfromHex(profileIconColor),
                    radius: 40,
                    child: const Image(
                        image: AssetImage("assets/images/profiletemp.png")),
                  ),
                ],
              ),
            ),
            backgroundColor: HexColor.getColorfromHex(interfaceColor),
            body: ListView(
              itemExtent: MediaQuery.of(context).size.height / 12,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 12,
                  MediaQuery.of(context).size.height / 14,
                  MediaQuery.of(context).size.width / 12,
                  MediaQuery.of(context).size.width / 14),
              primary: false,
              children: [
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      enableFeedback: false,
                      selectedTileColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      title: Text('Test',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.insights,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        onTap: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                        };
                      },
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      enableFeedback: false,
                      selectedTileColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      title: Text('Monitoreo',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.insights,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MonitoreoPage()),
                        );
                      },
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      title: Text('Notificaciones',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.notifications_none,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificacionesPage()),
                        );
                      },
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      title: Text('Calendario',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.today,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarioPage()),
                        );
                      },
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      title: Text('Alarmas',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.alarm,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      /*onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AlarmaPage()),
                        );
                      },*/
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      title: Text('Reporte',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.insert_chart_outlined,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ReportePage()),
                        );
                      },
                    )),
                Divider(
                    height: 2,
                    color: HexColor.getColorfromHex(dividerHomePageColor)),
                Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                    child: ListTile(
                      title: Text('Cerrar Sesión',
                          style: GoogleFonts.roboto(
                              fontSize: 21,
                              color: HexColor.getColorfromHex(
                                  dividerHomePageColor),
                              fontWeight: FontWeight.w400)),
                      trailing: Icon(Icons.power_settings_new,
                          size: MediaQuery.of(context).size.height / 18,
                          color: Colors.black),
                      onTap: () {
                        cognitoRepository.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    )),
              ],
            )));
  }
}
