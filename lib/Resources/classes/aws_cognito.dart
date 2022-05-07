import 'dart:async';
import 'dart:ffi';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AWSCognitoRepository {
  String username = '';

  Future<bool> signup(String email, String password, String name) async {
    try {
      final CognitoSignUpOptions options = CognitoSignUpOptions(
          userAttributes: {CognitoUserAttributeKey.parse('name'): name});
      SignUpResult res = await Amplify.Auth.signUp(
          username: email, password: password, options: options);
      return res.isSignUpComplete;
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
      getUser().then((value) => print(value));
    } on Exception {
      print("User $email login failed.");
      rethrow;
    }
  }

  Future<String?> getUser() async {
    try {
      final awsUser = await Amplify.Auth.getCurrentUser();
      return awsUser.username.toString();
    } catch (e) {
      return null;
    }
  }

  Future<void> Test() async {
    print(await Amplify.Auth.fetchDevices());
  }

  Future<bool> isLoggedIn() async {
    try {
      final awsUser = await Amplify.Auth.getCurrentUser();
      print("LOGIN RESULT: " + awsUser.toString());
      if (awsUser != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  String getUsername() {
    return username;
  }

  Future<bool> confirmAccount(String email, String code) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);
      return res.isSignUpComplete;
    } on AuthException catch (e) {
      print(e.message);
      return false;
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
