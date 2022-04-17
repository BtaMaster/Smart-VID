import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /*@override
  void initState(){
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }*/




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const Text('Bienvenido(a), [NOMBRE]',
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                          color: HexColor.getColorfromHex(dividerHomePageColor),
                          fontWeight: FontWeight.w400)),
                  trailing: Icon(Icons.power_settings_new,
                      size: MediaQuery.of(context).size.height / 18,
                      color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                )),
          ],
        ));
  }
}
