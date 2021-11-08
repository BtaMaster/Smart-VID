import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:smartvid/Resources/util/colors.dart';

import 'package:smartvid/Resources/pages/mapapage.dart';

class DispositivosPage extends StatefulWidget {
  const DispositivosPage({Key? key}) : super(key: key);

  @override
  _DispositivosPageState createState() => _DispositivosPageState();
}

class _DispositivosPageState extends State<DispositivosPage> {
  var rng = Random(); //Vamos a generar estados aleatorios
  List<bool> controllerstatus = [];
  @override
  Widget build(BuildContext context) {
    //Generamos los estados de los microcontroladores antes de devolver el widget:
    for (var i = 0; i < 4; i++) {
      controllerstatus.add(rng.nextBool());
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('DISPOSITIVOS',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Text(
                'Microcontroladores',
                style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.width / 18,
                    color: Colors.red[800],
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 32,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.grey[350],
              leading: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(Icons.memory,
                      size: MediaQuery.of(context).size.width / 6,
                      color: Colors.black)),
              title: Column(
                children: [
                  Text('Estado:',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Container(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.circle,
                      color: controllerstatus[0] ? Colors.green : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                    Container(
                      width: 20,
                    ),
                    Icon(
                      Icons.circle,
                      color: !controllerstatus[0] ? Colors.red : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                  ])
                ],
              ),
              trailing: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.grey[100]),
                        shape: MaterialStateProperty.resolveWith(
                          (shape) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                    child: Text('Ver Mapa',
                        style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapaPage(
                                point: LatLng(-13, -72),
                                nombre: "Controlador de ejemplo"))),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 16,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.grey[350],
              leading: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(Icons.memory,
                      size: MediaQuery.of(context).size.width / 6,
                      color: Colors.black)),
              title: Column(
                children: [
                  Text('Estado:',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Container(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.circle,
                      color: controllerstatus[1] ? Colors.green : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                    Container(
                      width: 20,
                    ),
                    Icon(
                      Icons.circle,
                      color: !controllerstatus[1] ? Colors.red : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                  ])
                ],
              ),
              trailing: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.grey[100]),
                        shape: MaterialStateProperty.resolveWith(
                          (shape) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                    child: Text('Ver Mapa',
                        style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapaPage(
                                point: LatLng(-13, -72),
                                nombre: "Controlador de ejemplo"))),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 16,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.grey[350],
              leading: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(Icons.memory,
                      size: MediaQuery.of(context).size.width / 6,
                      color: Colors.black)),
              title: Column(
                children: [
                  Text('Estado:',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Container(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.circle,
                      color: controllerstatus[2] ? Colors.green : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                    Container(
                      width: 20,
                    ),
                    Icon(
                      Icons.circle,
                      color: !controllerstatus[2] ? Colors.red : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                  ])
                ],
              ),
              trailing: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.grey[100]),
                        shape: MaterialStateProperty.resolveWith(
                          (shape) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                    child: Text('Ver Mapa',
                        style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapaPage(
                                point: LatLng(-13, -72),
                                nombre: "Controlador de ejemplo"))),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 16,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.grey[350],
              leading: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(Icons.memory,
                      size: MediaQuery.of(context).size.width / 6,
                      color: Colors.black)),
              title: Column(
                children: [
                  Text('Estado:',
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Container(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.circle,
                      color: controllerstatus[3] ? Colors.green : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                    Container(
                      width: 20,
                    ),
                    Icon(
                      Icons.circle,
                      color: !controllerstatus[3] ? Colors.red : Colors.grey,
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                  ])
                ],
              ),
              trailing: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (state) => Colors.grey[100]),
                        shape: MaterialStateProperty.resolveWith(
                          (shape) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )),
                    child: Text('Ver Mapa',
                        style: GoogleFonts.lato(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapaPage(
                                point: LatLng(-13, -72),
                                nombre: "Controlador de ejemplo"))),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 16,
            ),
          ],
        ));
  }
}
