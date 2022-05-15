import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/classes/aws_storage.dart';
import 'package:smartvid/Resources/pages/calendariopage.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/Resources/pages/profileconfigurationpage.dart';
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
final s3Repository = AWSStorageRepository();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = '';
  var pfpUrl =
      'https://smartvid-storage01535-staging.s3.us-east-1.amazonaws.com/public/profiletemp.png?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQC%2BVmOYqQ1EewDvk7JKX3rGV8qKzop%2FqNOPKPDdtOQmGQIhALFxSKOqz%2FxLPFlqptemorWwwRsTMuqUaCJe88yMrsoRKu0CCJT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMDY3NTIwODgwMDEzIgy0rlnFlvMxJNgkatYqwQKPkONSzCnWtXJ55QnKZgWpXwND%2Bn0mF6TnTJngzz6IDVgB0q8wg5tufosxi7bxYYKpkVcaFAo%2FRq6UMkUR12NHYqHPFQRQsuRZXw5n0YXD%2FKB77bs5X529W1p4DZgUa688Gx3BoCF%2Fo5ZF%2Bnkog6iVNUO7DCaefj%2BpQNJ6CeAJ%2FCtffoDGqg08rbkk3Dnu%2BTBjV25GYLbtnSZV%2B9ygZDPb9C9eE3UsFA5DA6lKWOSkDucwaux8vI2ECJEsLdOJTyD%2Fu0Wp7mzSCagjcjhPyiiQAFmuEPYWsigvGRdQ0zHuPvEWYQZPykJWemLsZq3psTXyyuOa0sAxvBT5YrgfTy6TT0H3vw7eGl%2BXRgEBo7%2FDVwnj9LrcYT5BzVPoJfVOTDK3zxPvIKk7YrsUEcBvYWUCm4OTLa35eDVqX1q1crhazG0w75WFlAY6sgIImKyUAX19QBsx7obv2OH9itbbC3REXev%2BuI%2F%2F8ykqCPyZl2%2BjzTwi2sEixQ1%2Fwif8OLhseawwshf0R7TLVlyUVTelonHhIp9MhQj158lj%2BFLsH5YkfLt%2FI64Gfz7vGl04LFjc1%2Fz011bUz0CYKETFpwN9Wf97Ajvec65cIfnR1R8en4GZeWfZMtakteXvaJSX7zMjx4UkO%2B88w8cTPfzQMhwNtpw0BtkrvCGIEn9%2F9s%2BwNnAvv4ltMBVIFW3Al28iLsDwE%2Bxu6YCF9oYPcU25uVvnTyEpQBLZQn6TXVtsLAeomDxneEgErwVZPgERx%2FNlUiMqgi2jH2y2S54p%2Bt3CKnb4c6%2BrBtGaRSyqWRnI1TvkBHkczivlD2D0undsaVdDfz1VK5Pe7TFVxliZr3VeoMM%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220515T191401Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAQ7OEO3WGXPPNEIVO%2F20220515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ffe3e11b766606865ec247cfccbc2a02a2fc806a49601ec97bdac0df21cb43a';

  @override
  void initState() {
    super.initState();
    //final messaging = FirebaseMessaging.instance;
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
                            radius: 40,
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
                                    const NotificacionesPage()),
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
