import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{

 FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

 initNotifications(){
   _firebaseMessaging.requestPermission();

   _firebaseMessaging.getToken().then((token) {
     print('-----Token del Dispositivo-----');
     print(token);
   });
 }

}