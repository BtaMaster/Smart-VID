import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:smartvid/Resources/classes/tokenNotification.dart';

class PushNotificationProvider{

 final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;


 initNotifications(){
   _firebaseMessaging.requestPermission();

   _firebaseMessaging.getToken().then((token) {
     print('-----Token del Dispositivo-----');
     print(token);

     final tokenGuardar = TokenNotification(token!, DateTime.now());

     TokenSave().guardarToken(tokenGuardar);
   });
 }

}