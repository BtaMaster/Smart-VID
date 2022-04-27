import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/aws_cognito.dart';
import 'package:smartvid/Resources/pages/loginpage.dart';
import 'package:smartvid/Resources/util/colors.dart';

final cognitoRepository = AWSCognitoRepository();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
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
                              builder: (context) => const HomePage()),
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
                              builder: (context) => const HomePage()),
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
                              builder: (context) => const HomePage()),
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
                              builder: (context) => const HomePage()),
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
