import 'package:flutter/material.dart';
import 'package:smartvid/Resources/classes/notificacion.dart';
import 'package:smartvid/Resources/pages/homepage.dart';
import 'package:smartvid/Resources/util/colors.dart';

import 'package:smartvid/Resources/pages/notificaciondetallepage.dart';

class NotificacionesPage extends StatefulWidget {
  final List<Notificacion>? notificaciones;
  const NotificacionesPage({Key? key, this.notificaciones}) : super(key: key);

  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {

  final home = const HomePage();

  List<Notificacion> notificacionesActuales = <Notificacion>[/*
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
        "Se detectó un valor fuera del rango optimo de humedad de suelo."),*/
  ];


  void eliminarNotificacion(int index){
    widget.notificaciones!.removeAt(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTIFICACIONES"),
        centerTitle: true,
      ),
      backgroundColor: HexColor.getColorfromHex(interfaceColor),
      body:  ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: widget.notificaciones!.length,
          separatorBuilder: (BuildContext context, _) =>
              Container(height: MediaQuery.of(context).size.width / 32),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              tileColor: Colors.white,
              title: Text(widget.notificaciones![index].titulo),
              subtitle: widget.notificaciones![index].mensaje != null
                  ? Text(widget.notificaciones![index].mensaje ?? '')
                  : null,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificacionDetallePage(
                          notificacion:widget.notificaciones![index])
                  )
              ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(onPressed: () {
                  eliminarNotificacion(index);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Se ha eliminado la notificación'),
                    backgroundColor: Colors.purple,
                  ));
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.delete))
              ],
            ),
            );
          }),
    );
  }
}
