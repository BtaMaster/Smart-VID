import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioVegetativoPage extends StatefulWidget {
  const CalendarioVegetativoPage({Key? key}) : super(key: key);

  @override
  _CalendarioVegetativoPageState createState() =>
      _CalendarioVegetativoPageState();
}

class _CalendarioVegetativoPageState extends State<CalendarioVegetativoPage> {
  String faseActualA = "Reposo Invernal";
  int diasTranscurridosA = 39;
  int diasFaltantesA = 51;
  String siguienteFaseA = "Crecimiento de los Órganos";
  String faseActualB = "Lloros";
  int diasTranscurridosB = 9;
  int diasFaltantesB = 21;
  String siguienteFaseB = "Desborre";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALENDARIO VEGETATIVO"),
        centerTitle: true,
      ),
      backgroundColor: HexColor.getColorfromHex(interfaceColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Text(
                    "FASE ACTUAL: $faseActualA",
                    style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.width / 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Días Transcurridos:\n$diasTranscurridosA",
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Días Faltantes:\n$diasFaltantesA",
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      Expanded(
                        child: Text(
                          "SIGUIENTE FASE:\n$siguienteFaseA",
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Colors.lightGreen[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "FASE ACTUAL: $faseActualB",
                    style: GoogleFonts.lato(
                        fontSize: MediaQuery.of(context).size.width / 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Días Transcurridos:\n$diasTranscurridosB",
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Días Faltantes:\n$diasFaltantesB",
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                      ),
                      Expanded(
                        child: Text(
                          "SIGUIENTE FASE:\n$siguienteFaseB",
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Colors.lightGreen[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
