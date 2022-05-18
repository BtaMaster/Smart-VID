import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/recomendaciones.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:smartvid/Resources/classes/notificacion.dart';

class NotificacionDetallePage extends StatefulWidget {
  final Notificacion notificacion;
  const NotificacionDetallePage({Key? key, required this.notificacion})
      : super(key: key);
  @override
  _NotificacionDetallePageState createState() =>
      _NotificacionDetallePageState();
}

class _NotificacionDetallePageState extends State<NotificacionDetallePage> {

  List<Recomendacion> recomendaciones = <Recomendacion>[
  /*  RecomendacionLuminosidad(
        "Baja producción de antocianinas(luminosidad baja)"),
    RecomendacionLuminosidad(
        "Reducción de tasa de biosintesis (luminosidad alta)"),
    RecomendacionLuminosidad(
        "Reducción de tasa de biosintesis (luminosidad alta)"),
    RecomendacionAgua("Uvas resecas (humedad baja)"),
    RecomendacionPlaga("Probabilidad de plaga"),
    RecomendacionFollaje(
        "Poco follaje y deficiente relacion hoja-fruto (sobrecarga)"),
    RecomendacionHongo("Mal cuaje"),
    RecomendacionHongo("Maduración deficiente"),*/
  ];

  @override
  void initState(){
    mostrarRecomendaciones();
  }
  void mostrarRecomendaciones(){
    print(widget.notificacion.titulo);
    switch(widget.notificacion.titulo){
      case 'Notificacion: Humedad Relativa':
          recomendaciones.addAll(<Recomendacion>[RecomendacionPlaga("Probabilidad de plaga"), RecomendacionHongo("Enfermedades"),
          RecomendacionFollaje("Degradación de Uva"), RecomendacionPlaga("Chanchito blanco de la vid"), RecomendacionHongo("Oídio"),
          RecomendacionAgua("Uso de plagicidas")]);
        break;
      case 'Notificacion: Luminosidad Solar':
        recomendaciones.addAll(<Recomendacion>[RecomendacionLuminosidad("Baja produccion de antocianinas (luminosidad baja)"), RecomendacionLuminosidad("Reduccion de tasa de biosintesis (luminosidad alta)"),
          RecomendacionFollaje("Uvas muy vigorosas(poco luminosidad)"), RecomendacionFollaje("Uvas poco vigorosas(alta luminosidad)"), RecomendacionFollaje("Poco follaje ydeficiente relacion hoja-fruto(sobrecarga)"),
          RecomendacionLuminosidad("Mal cuaje(baja luminosidad)"), RecomendacionLuminosidad("Maduracion deficiente(baja iluminacion)")]);
        break;
      case 'Notificacion: Temperatura Relativa':
        recomendaciones.addAll(<Recomendacion>[RecomendacionFollaje("Frutificacion-Concentracion de azucares en vides"), RecomendacionAgua("Floracion (clima seco y escazas lluvias)"),
          RecomendacionFollaje("Daño de brotes y hojas jovenes(periodo vegetativo vid)"), RecomendacionHongo("Hongo de madera"), RecomendacionHongo("Brotytis"), RecomendacionHongo("Oídio"),
          RecomendacionLuminosidad("Mildiu de la vid (Temperatura alta)"), RecomendacionLuminosidad("Quemaduras de hoja y racimos(temperaturas elevadas)")]);
        break;
      case 'Notificacion: Temperatura Suelo':
        recomendaciones.addAll(<Recomendacion>[RecomendacionFollaje("Uvas poco vigorosas(alta temperatura)"), RecomendacionLuminosidad("Poco follaje y deficiente relacion hoja-fruto (sobrecarga)"),
          RecomendacionLuminosidad("Mal cuaje(baja temperatura)"), RecomendacionLuminosidad("Maduracion deficiente(baja temperatura)")]);
        break;
      case 'Notificacion: Humedad Suelo':
        recomendaciones.addAll(<Recomendacion>[RecomendacionHongo("Problemas de hongos en las plantas"), RecomendacionFollaje("Desarrollo y crecimiento de los cultivos"),
          RecomendacionAgua("Demanda hidrica entre fases"), RecomendacionAgua("Disminución fotosintetica(pesima condicion de la humedad del suelo)"), RecomendacionAgua("Chanchitos blancos(humedad del suelo elevada)"),
          RecomendacionFollaje("Caida de hojas y frutos(poca humedad del suelo)"), RecomendacionFollaje("Evitar punto de marchitez")]);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("NOTIFICACIONES"),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.white,
              child: Column(
                children: [
                  Container(height: MediaQuery.of(context).size.width / 32),
                  Text(widget.notificacion.titulo,
                      style: GoogleFonts.lato(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Container(height: MediaQuery.of(context).size.width / 32),
                  if (widget.notificacion.mensaje != null)
                    Text(widget.notificacion.mensaje ?? '',
                        style: GoogleFonts.lato(
                            fontSize: MediaQuery.of(context).size.width / 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center),
                  Container(height: MediaQuery.of(context).size.width / 16),
                  Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hora de Ocurrencia:   ",
                                    style: GoogleFonts.lato(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                Container(
                                    height:
                                        MediaQuery.of(context).size.width / 16),
                                if (widget.notificacion.valorOptimo != null)
                                  Text("Valor Óptimo:",
                                      style: GoogleFonts.lato(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                if (widget.notificacion.valorOptimo != null)
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              16),
                                if (widget.notificacion.valorDetectado != null)
                                  Text("Valor Detectado:",
                                      style: GoogleFonts.lato(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.notificacion.horaOcurrencia,
                                    style: GoogleFonts.lato(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                19,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                Container(
                                    height:
                                        MediaQuery.of(context).size.width / 16),
                                if (widget.notificacion.valorOptimo != null)
                                  Text((widget.notificacion.valorOptimo ?? ''),
                                      style: GoogleFonts.lato(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                if (widget.notificacion.valorOptimo != null)
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              16),
                                if (widget.notificacion.valorDetectado != null)
                                  Text(
                                      (widget.notificacion.valorDetectado ??
                                          ''),
                                      style: GoogleFonts.lato(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                              ])
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 16,
              color: HexColor.getColorfromHex(interfaceColor),
            ),

            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: recomendaciones.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      //Aquí va el titulo de la lista:
                      return const ListTile(
                        contentPadding: EdgeInsets.all(10),
                        tileColor: Colors.white,
                        title: Center(child: Text("Posibles afectaciones")),
                      );
                    }
                    return ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      tileColor: Colors.white,
                      title: Text(recomendaciones[index - 1].mensaje),
                      leading: Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: recomendaciones[index - 1].widget,
                      ),
                    );
                  }),

            ),
          ],
        ));
  }
}
