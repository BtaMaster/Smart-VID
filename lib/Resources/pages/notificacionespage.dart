import 'package:flutter/material.dart';
import 'package:smartvid/Resources/classes/notificacion.dart';
import 'package:smartvid/Resources/util/colors.dart';

import 'package:smartvid/Resources/pages/notificaciondetallepage.dart';

class NotificacionesPage extends StatefulWidget {
  const NotificacionesPage({Key? key}) : super(key: key);

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  List<Notificacion> notificaciones = <Notificacion>[
    NotificacionLuminosidadSolarTest(
        "Se detectó un valor fuera del rango oportuno de luminosidad."),
    NotificacionLuminosidadSolar(
        "Se detectó un valor fuera del rango oportuno de luminosidad."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango de temperatura relativa."),
    NotificacionHumedadRelativa(
        "Se detectó un valor fuera del rango optimo de humedad relativa."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango optimo de temperatura suelo."),
    NotificacionHumedadSuelo(
        "Se detectó un valor fuera del rango optimo de humedad de suelo."),
    NotificacionLuminosidadSolar(
        "Se detectó un valor fuera del rango oportuno de luminosidad."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango de temperatura relativa."),
    NotificacionHumedadRelativa(
        "Se detectó un valor fuera del rango optimo de humedad relativa."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango optimo de temperatura suelo."),
    NotificacionHumedadSuelo(
        "Se detectó un valor fuera del rango optimo de humedad de suelo."),
    NotificacionLuminosidadSolar(
        "Se detectó un valor fuera del rango oportuno de luminosidad."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango de temperatura relativa."),
    NotificacionHumedadRelativa(
        "Se detectó un valor fuera del rango optimo de humedad relativa."),
    NotificacionTemperaturaRelativa(
        "Se detectó un valor fuera del rango optimo de temperatura suelo."),
    NotificacionTemperaturaSuelo(
        "Se detectó un valor fuera del rango optimo de humedad de suelo."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTIFICACIONES"),
        centerTitle: true,
      ),
      backgroundColor: HexColor.getColorfromHex(interfaceColor),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: notificaciones.length,
          separatorBuilder: (BuildContext context, _) =>
              Container(height: MediaQuery.of(context).size.width / 32),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.white,
              title: Text(notificaciones[index].titulo),
              subtitle: notificaciones[index].mensaje != null
                  ? Text(notificaciones[index].mensaje ?? '')
                  : null,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificacionDetallePage(
                          notificacion: notificaciones[index]))),
            );
          }),
    );
  }
}
