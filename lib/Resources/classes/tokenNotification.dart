import 'package:firebase_database/firebase_database.dart';

class TokenNotification{

  late final String token;
  late final DateTime fecha;

  TokenNotification(this.token, this.fecha);

  TokenNotification.fromJson(Map<dynamic, dynamic>json)
  : token = json['token'] as String,
    fecha = DateTime.parse(json['fecha'] as String);

  Map<dynamic,dynamic>toJson() => <dynamic,dynamic>{
    'token': token,
    'fecha': fecha.toString(),
  };


}

class TokenSave{
  final DatabaseReference tokenReference = FirebaseDatabase.instance.ref().child('tokens');
  final snap = FirebaseDatabase.instance.ref().child('tokens').get();
  
  void guardarToken(TokenNotification tokenNotification){
    var tokenEncontrado = tokenReference.child('token').equalTo(tokenNotification.token);
    tokenReference.push().set(tokenNotification.toJson());
  }
}