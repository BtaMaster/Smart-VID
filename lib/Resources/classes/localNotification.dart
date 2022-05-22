import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../pages/notificaciondetallepage.dart';
import '../pages/notificacionespage.dart';
import 'notificacion.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);



class LocalNotification{

  static final FlutterLocalNotificationsPlugin flutterNotification = FlutterLocalNotificationsPlugin();

  static void initialize(context, body, valorDetectado) {
    final InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'));

    flutterNotification.initialize(initializationSettings,onSelectNotification: (String? problema) async{
      switch(problema){
        case 'Humedad Relativa':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
            (notificacion: NotificacionHumedadRelativa(body,
              valorDetectado: valorDetectado))));
          break;
        case 'Luminosidad Solar':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
            (notificacion: NotificacionLuminosidadSolar(body,
              valorDetectado: valorDetectado))));
          break;
        case 'Temperatura Relativa':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
            (notificacion: NotificacionTemperaturaRelativa(body,
              valorDetectado: valorDetectado))));
          break;
        case 'Temperatura Suelo':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
            (notificacion: NotificacionTemperaturaSuelo(body,
              valorDetectado: valorDetectado))));
          break;
        case 'Humedad Suelo':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificacionDetallePage
            (notificacion: NotificacionHumedadSuelo(body,
              valorDetectado: valorDetectado))));
          break;
        default:
          Navigator.of(context)
              .push(MaterialPageRoute(builder:
              (context) => const NotificacionesPage()));
          break;
      }
    });
  }

  static void mostrar(RemoteMessage message) async{
    await flutterNotification
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
     print("Mostrar");
     final NotificationDetails notificationDetails = NotificationDetails(
         android: AndroidNotificationDetails(
               channel.id,
               channel.name,
               channelDescription : channel.description,
               color: Colors.blue,
               playSound: true,
               icon: '@mipmap/ic_launcher',
         ));

     await flutterNotification.show(
         message.notification!.hashCode,
         message.notification!.title,
         message.notification!.body,
         notificationDetails,
        payload: message.data['problema'],
     );
  }
}
