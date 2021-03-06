import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/classes/aws_storage.dart';
import 'package:smartvid/Resources/pages/profileconfigurationpage.dart';
import 'package:smartvid/Resources/pages/calendariopage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/Resources/pages/menualarmas.dart';
import 'package:smartvid/Resources/pages/menurecordatorios.dart';
import 'package:smartvid/Resources/pages/reportepage.dart';
import 'package:smartvid/Resources/util/colors.dart';
import '../classes/aws_cognito.dart';
import '../classes/localNotification.dart';
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
final s3Repository = AWSStorageRepository();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = '';
  var pfpUrl = '';


  List<Notificacion> notificacionesHome = <Notificacion>[];

 @override
  void initState(){
    super.initState();
    PushNotificationProvider().initNotifications();
    cognitoRepository.getName().then((value) => setState(() {
          name = value;
          print(name);
        }));
    s3Repository.getPfpUrl().then((value) => setState(() {
          pfpUrl = value!;
          print(pfpUrl);
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

    FirebaseMessaging.instance.getInitialMessage().then((message){
      if(message != null){
        sendDetalleNotificacion(message.notification!.body.toString(),
            message.data['problema'], message.data['valorDetectado']);
        enviarNotificacion(message.notification?.body, message.data['problema'], message.data['valorDetectado']);
      }
    });



    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await Firebase.initializeApp();

      LocalNotification.initialize(context, message.notification!.body, message.data['valorDetectado']);

      print('Mensaje con aplicación Abierta');
      print('Data del Mensaje: ${message.data}');
      if (message.notification != null) {
        print('Título de Notificacion: ${message.notification!.title}');
        print('Descripcion de Notificacion: ${message.notification!.body}');
        if(message.notification?.body != null) {
          enviarNotificacion(
              message.notification?.body, message.data['problema'],
              message.data['valorDetectado']);
        }
      }
      LocalNotification.mostrar(message);
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
        }
      if(message.data != null) {
        sendDetalleNotificacion(message.notification!.body.toString(),
            message.data['problema'], message.data['valorDetectado']);
        enviarNotificacion(message.notification?.body, message.data['problema'], message.data['valorDetectado']);
      }
      }
    });
  }

 void enviarNotificacion(String? body, String problema, String valorDetectado){
   print("Se va a agregar una notificacion");
   switch(problema){
     case 'Humedad Relativa':
       notificacionesHome.add(NotificacionHumedadRelativa(body!,valorDetectado: valorDetectado));
       break;
     case 'Luminosidad Solar':
       notificacionesHome.add(NotificacionLuminosidadSolar(body!,valorDetectado: valorDetectado));
       print(notificacionesHome);
       break;
     case 'Temperatura Relativa':
       notificacionesHome.add(NotificacionTemperaturaRelativa(body!,valorDetectado: valorDetectado));
       break;
     case 'Temperatura Suelo':
       notificacionesHome.add(NotificacionTemperaturaSuelo(body!,valorDetectado: valorDetectado));
       break;
     case 'Humedad Suelo':
       notificacionesHome.add(NotificacionHumedadSuelo(body!,valorDetectado: valorDetectado));
       break;
   }
 }


 void sendDetalleNotificacion(String body, String problema, String valorDetectado){
     switch(problema){
       case 'Humedad Relativa':
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
           (notificacion: NotificacionHumedadRelativa(body,
             valorDetectado: valorDetectado))));
         break;
       case 'Luminosidad Solar':
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
           (notificacion: NotificacionLuminosidadSolar(body,
             valorDetectado: valorDetectado))));
         break;
       case 'Temperatura Relativa':
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
           (notificacion: NotificacionTemperaturaRelativa(body,
             valorDetectado: valorDetectado))));
         break;
       case 'Temperatura Suelo':
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
           (notificacion: NotificacionTemperaturaSuelo(body,
             valorDetectado: valorDetectado))));
         break;
       case 'Humedad Suelo':
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
           (notificacion: NotificacionHumedadSuelo(body,
             valorDetectado: valorDetectado))));
         break;
       default:
         Navigator.of(context)
             .push(MaterialPageRoute(builder:
             (context) => const NotificacionesPage()));
         break;
     }
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
                          pfpUrl != '' ? CircleAvatar(
                              backgroundColor:
                                  HexColor.getColorfromHex(profileIconColor),
                              radius: 50,
                              backgroundImage: NetworkImage(pfpUrl),
                            ) : CircleAvatar(
                              backgroundColor:
                                  HexColor.getColorfromHex(profileIconColor),
                              radius: 50,
                              child: const Image(
                                image: AssetImage("assets/images/profiletemp.png")),
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
                                builder: (context) =>
                                    NotificacionesPage(notificaciones: notificacionesHome)),
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
                        onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuAlarmas()),
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
                  Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text('Recordatorios',
                            style: GoogleFonts.roboto(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        trailing: Icon(Icons.message,
                            size: MediaQuery.of(context).size.height / 18,
                            color: Colors.black),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MenuRecordatorios()),
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
                        enableFeedback: false,
                        selectedTileColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        title: Text('Configuración',
                            style: GoogleFonts.roboto(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        trailing: Icon(Icons.settings_outlined,
                            size: MediaQuery.of(context).size.height / 18,
                            color: Colors.black),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileConfigurationPage()),
                          ).then((value) => {
                                cognitoRepository
                                    .getName()
                                    .then((value) => setState(() {
                                          name = value;
                                        })),
                                s3Repository
                                    .getPfpUrl()
                                    .then((value) => setState(() {
                                          pfpUrl = value!;
                                        }))
                              });
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
                ])));
  }
}
