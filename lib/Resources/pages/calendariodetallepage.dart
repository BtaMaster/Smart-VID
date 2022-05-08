import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/fases.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioDetallePage extends StatefulWidget {
  final String tipoCalendario;
  const CalendarioDetallePage({Key? key, required this.tipoCalendario})
      : super(key: key);

  @override
  _CalendarioVegetativoPageState createState() =>
      _CalendarioVegetativoPageState();
}

class _CalendarioVegetativoPageState extends State<CalendarioDetallePage> {
  @override
  Widget build(BuildContext context) {
    DateTime fechaActual = DateTime.now();
    late Fase faseActual1 = FaseNula();
    late Fase faseActual2 = FaseNula();
    if (widget.tipoCalendario == 'VEGETATIVO') {
      /* Fase 1 */
      if (fechaActual.isBefore(DateTime.now().month == 12
          ? DateTime(DateTime.now().year + 1, 5, 1)
          : DateTime(DateTime.now().year, 5, 1))) {
        faseActual1 = FaseReposoInvernal();
      } else if (fechaActual.isBefore(DateTime(DateTime.now().year, 9, 16))) {
        faseActual1 = FaseCrecimientoOrganosVegetativos();
      } else if (fechaActual.isBefore(DateTime(DateTime.now().year, 12, 1))) {
        faseActual1 = FaseAgostamiento();
      }

      /* Fase 2 */
      if (fechaActual.isBefore(DateTime(DateTime.now().year, 3, 16))) {
        faseActual2 = FaseLloros();
      } else if (fechaActual.isBefore(DateTime(DateTime.now().year, 5, 16))) {
        faseActual2 = FaseDesborre();
      } else if (fechaActual.isBefore(DateTime(DateTime.now().year, 9, 16))) {
        faseActual2 = FaseParadaCrecimiento();
      } else if (fechaActual.isBefore(DateTime(DateTime.now().year, 12, 16))) {
        faseActual2 = FaseCaidaHojas();
      }
    } else {
       /* Fase 1 */
      if (fechaActual.isAfter(DateTime(DateTime.now().year, 5, 14)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 6, 16))) {
        faseActual1 = FasePoda();
      } else if (fechaActual.isAfter(DateTime(DateTime.now().year, 6, 15)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 7, 16))) {
        faseActual1 = FaseBrotacion();
      } else if (fechaActual.isAfter(DateTime(DateTime.now().year, 7, 15)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 8, 16))) {
        faseActual1 = FaseFloracion();
      } else if (fechaActual.isAfter(DateTime(DateTime.now().year, 8, 15)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 9, 16))) {
        faseActual1 = FaseFructificacion();
      } else if (fechaActual.isAfter(DateTime(DateTime.now().year, 9, 15)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 11, 1))) {
        faseActual1 = FaseMaduracion();
      }

      /* Fase 2 */
      if (fechaActual.isAfter(DateTime(DateTime.now().year, 9, 14)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 10, 16))) {
        faseActual2 = FaseEnvero();
      } else if (fechaActual.isAfter(DateTime(DateTime.now().year, 10, 15)) && 
      fechaActual.isBefore(DateTime(DateTime.now().year, 11, 16))) {
        faseActual2 = FaseCosecha();
      }
    }

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
              color: Color.fromARGB(255, 158, 158, 158),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (faseActual1.faseActual == "Sin fase")
                      ...[
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No existe fase 1",
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 25,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      ]
                    else ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fase Actual: " + faseActual1.faseActual,
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 23,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Días Transcurridos:\n" +
                                    faseActual1.diasTranscurridos.toString(),
                                style: GoogleFonts.lato(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Días Faltantes:\n" +
                                    faseActual1.diasFaltantes.toString(),
                                style: GoogleFonts.lato(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Expanded(
                            child: Text(
                              "Siguiente Fase:\n" +
                                  faseActual1.siguienteFase.toString(),
                              style: GoogleFonts.lato(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 26,
                                  color:
                                      const Color.fromARGB(255, 193, 255, 128),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (faseActual2.faseActual == "Sin fase")
                      ...[
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "No existe fase 2 ",
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 25,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      ]
                    else ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Fase Actual: " + faseActual2.faseActual,
                          style: GoogleFonts.lato(
                              fontSize: MediaQuery.of(context).size.width / 23,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Días Transcurridos:\n" +
                                    faseActual2.diasTranscurridos.toString(),
                                style: GoogleFonts.lato(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Días Faltantes:\n" +
                                    faseActual2.diasFaltantes.toString(),
                                style: GoogleFonts.lato(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          Expanded(
                            child: Text(
                              "Siguiente Fase:\n" +
                                  faseActual2.siguienteFase.toString(),
                              style: GoogleFonts.lato(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 26,
                                  color:
                                      const Color.fromARGB(255, 193, 255, 128),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
