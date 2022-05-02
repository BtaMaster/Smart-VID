import 'package:firebase_database/firebase_database.dart';

class TokenNotification{

  late final String token;


  TokenNotification(this.token);

  TokenNotification.fromJson(Map<dynamic, dynamic>json)
  : token = json['token'] as String;

  Map<dynamic,dynamic>toJson() => <dynamic,dynamic>{
    'token': token,
  };


}

class TokenSave{
  final DatabaseReference tokenReference = FirebaseDatabase.instance.reference();

  void guardarToken(TokenNotification tokenNotification){
    tokenReference.push().set(tokenNotification.toJson());
  }
}