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
  final DatabaseReference tokenReference = FirebaseDatabase.instance.reference();

  void guardarToken(TokenNotification tokenNotification){
    tokenReference.push().set(tokenNotification.toJson());
  }
}