import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';

class Notificacion {
  final String titulo; //El titulo siempre es obligatorio
  final String? mensaje;
  final String? valorOptimo;
  final String? valorDetectado;
  final String? valorDetectadoMostrar;
  final String horaOcurrencia;
  Notificacion(
      {required this.titulo,
      this.mensaje,
      this.valorOptimo,
      this.valorDetectado,
        this.valorDetectadoMostrar,
      required this.horaOcurrencia});
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
            valorDetectado: valorDetectado,
            valorDetectadoMostrar: valorDetectado! + ' lux');
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
            valorDetectadoMostrar: valorDetectado! + ' °C',
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
            valorDetectadoMostrar: valorDetectado! + ' %',
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
            valorDetectado: valorDetectado,
            valorDetectadoMostrar: valorDetectado! + ' °C');
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
            valorDetectado: valorDetectado,
            valorDetectadoMostrar: valorDetectado! + ' %');
}
