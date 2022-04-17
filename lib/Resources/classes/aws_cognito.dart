import 'dart:async';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final userPool = CognitoUserPool(
  dotenv.env['USER_POOL_ID'] ?? '', //UserPoolId
  dotenv.env['USER_POOL_CLIENTID'] ?? '', //clientId
);

class AWSCognitoRepository {
  Future<void> signup(
      String email, String password, String name) async {
    try {
      final CognitoSignUpOptions options =
          CognitoSignUpOptions(userAttributes: {
        CognitoUserAttributeKey.parse('name'): name
      });
      await Amplify.Auth.signUp(
          username: email, password: password, options: options);
      print("User $email created!.");
    } on Exception {
      print("User $email signup failed.");
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    await signOut();
    try {
      await Amplify.Auth.signIn(username: email, password: password);
      print("User $email logged in!.");
      getUser(email, password).then((value) => print(value));
    } on Exception {
      print("User $email login failed.");
      rethrow;
    }
  }

  Future<String?> getUser(String email, String password) async {
    try {
      final awsUser = await Amplify.Auth.getCurrentUser();
      return awsUser.username.toString();
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
      print("User signed out.");
    } catch (e) {
      print("User sign out failed.");
    }
  }
}
