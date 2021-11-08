import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/fases.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioDetallePage extends StatefulWidget {
  final String tipoCalendario;
  final Fase fase1;
  final Fase fase2;
  const CalendarioDetallePage(
      {Key? key,
      required this.tipoCalendario,
      required this.fase1,
      required this.fase2})
      : super(key: key);

  @override
  _CalendarioVegetativoPageState createState() =>
      _CalendarioVegetativoPageState();
}

class _CalendarioVegetativoPageState extends State<CalendarioDetallePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALENDARIO " + widget.tipoCalendario),
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
                    "FASE ACTUAL: " + widget.fase1.faseActual,
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
                            "Días Transcurridos:\n" +
                                widget.fase1.diasTranscurridos.toString(),
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Días Faltantes:\n" +
                                widget.fase1.diasFaltantes.toString(),
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
                          "SIGUIENTE FASE:\n" +
                              widget.fase1.siguienteFase.toString(),
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Colors.lightGreen[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "FASE ACTUAL: " + widget.fase2.faseActual.toString(),
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
                            "Días Transcurridos:\n" +
                                widget.fase2.diasTranscurridos.toString(),
                            style: GoogleFonts.lato(
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Días Faltantes:\n" +
                                widget.fase2.diasFaltantes.toString(),
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
                          "SIGUIENTE FASE:\n" +
                              widget.fase2.siguienteFase.toString(),
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
