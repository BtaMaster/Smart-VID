import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';

class Notificacion {
  final String titulo; //El titulo siempre es obligatorio
  final String? mensaje;
  final String? valorOptimo;
  final String? valorDetectado;
  final String horaOcurrencia;
  Notificacion(
      {required this.titulo,
      this.mensaje,
      this.valorOptimo,
      this.valorDetectado,
      required this.horaOcurrencia});
}

class NotificacionLuminosidadSolarTest extends Notificacion {
  NotificacionLuminosidadSolarTest(String mensaje)
      : super(
            titulo: "Notificacion: Luminosidad Solar",
            mensaje: mensaje,
            valorOptimo: "40000-80000 Lux",
            valorDetectado: "95000 Lux",
            horaOcurrencia: DateFormat('kk:mm d/M/y').format(DateTime.now()));
}

class NotificacionLuminosidadSolar extends Notificacion {
  NotificacionLuminosidadSolar(String mensaje,
      {String? valorDetectado})
      : super(
            titulo: "Notificacion: Luminosidad Solar",
            mensaje: mensaje,
            horaOcurrencia:
                DateFormat('kk:mm \n EEE d MMM').format(DateTime.now()),
            valorOptimo: "40000-80000 Lux",
            valorDetectado: valorDetectado);
}

class NotificacionTemperaturaRelativa extends Notificacion {
  NotificacionTemperaturaRelativa(String mensaje,
      {String? valorDetectado})
      : super(
            titulo: "Notificacion: Temperatura Relativa",
            mensaje: mensaje,
            horaOcurrencia:
                DateFormat('kk:mm \n EEE d MMM').format(DateTime.now()),
            valorOptimo: "26°C - 30°C",
            valorDetectado: valorDetectado);
}

class NotificacionHumedadRelativa extends Notificacion {
  NotificacionHumedadRelativa(String mensaje,
      {String? valorDetectado})
      : super(
            titulo: "Notificacion: Humedad Relativa",
            mensaje: mensaje,
            horaOcurrencia:
                DateFormat('kk:mm \n EEE d MMM').format(DateTime.now()),
            valorOptimo: "60% - 70%",
            valorDetectado: valorDetectado);
}

class NotificacionTemperaturaSuelo extends Notificacion {
  NotificacionTemperaturaSuelo(String mensaje,
      {String? valorDetectado})
      : super(
            titulo: "Notificacion: Temperatura Suelo",
            mensaje: mensaje,
            horaOcurrencia:
                DateFormat('kk:mm \n EEE d MMM').format(DateTime.now()),
            valorOptimo: "25°C - 30°C",
            valorDetectado: valorDetectado);
}

class NotificacionHumedadSuelo extends Notificacion {
  NotificacionHumedadSuelo(String mensaje,
      {String? valorDetectado})
      : super(
            titulo: "Notificacion: Humedad Suelo",
            mensaje: mensaje,
            horaOcurrencia:
                DateFormat('kk:mm \n EEE d MMM').format(DateTime.now()),
            valorOptimo: "35% - 45%",
            valorDetectado: valorDetectado);
}
