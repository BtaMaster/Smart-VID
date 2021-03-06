import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart';

String sha1RandomString() {
  final randomNumber = Random().nextDouble();
  final randomBytes = utf8.encode(randomNumber.toString());
  final randomString = sha1.convert(randomBytes).toString();
  return randomString;
}

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
      return false;
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
      if (awsUser != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<String> getName() async {
    try {
      final res = await Amplify.Auth.fetchUserAttributes();
      final name = res[2].value;
      if (name.isNotEmpty) {
        return name;
      } else {
        return '';
      }
    } catch (e) {
      return '';
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

  Future<bool> resetPassword(String email) async {
    try {
      ResetPasswordResult res = await Amplify.Auth.resetPassword(
        username: email,
      );
      print("Recovery email send");
      return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> confirmNewPassword(
      String email, String newPassword, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmResetPassword(
          username: email,
          newPassword: newPassword,
          confirmationCode: confirmationCode);
      print("Password changed");
      return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateName(String newName) async {
    try {
      await Amplify.Auth.updateUserAttribute(
        userAttributeKey: CognitoUserAttributeKey.name,
        value: newName,
      );
      print("Name changed");
      return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updatePassword(String oldpassword, String newPassword) async {
    try {
      await Amplify.Auth.updatePassword(
        oldPassword: oldpassword,
        newPassword: newPassword,
      );
      print("Password changed");
      return true;
    } on AmplifyException catch (e) {
      print(e);
      print("Wrong credentials.");
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

  Future<bool> deleteAccount(String password) async {
    try {
      //await Amplify.Auth.deleteUser();
      print(password);
      await Amplify.Auth.updatePassword(
        oldPassword: password,
        newPassword: sha1RandomString() + '!A1z#%',
      );
      print('Delete user succeeded');
      return true;
    } on Exception catch (e) {
      print('Delete user failed with error: $e');
      return false;
    }
  }
}
