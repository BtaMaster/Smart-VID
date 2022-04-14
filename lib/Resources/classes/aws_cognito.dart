import 'dart:async';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final userPool = CognitoUserPool(
  dotenv.env['USER_POOL_ID'] ?? '', //UserPoolId
  dotenv.env['USER_POOL_CLIENTID'] ?? '', //clientId
);

abstract class AWSCognitoRepository {
  Future<void> signup(
      String email, String password, String firstName, String lastName) async {
    final userAttributes = [
      AttributeArg(name: 'first_name', value: firstName),
      AttributeArg(name: 'last_name', value: lastName),
    ];
    var data;
    try {
      data = await userPool.signUp(
        email,
        password,
        userAttributes: userAttributes,
      );
      print("Sign up successful!");
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    final cognitoUser = CognitoUser(email, userPool);
    final authCredentials =
        AuthenticationDetails(username: email, password: password);
    CognitoUserSession? session =
        await cognitoUser.authenticateUser(authCredentials);
    try {
      session = await cognitoUser.authenticateUser(authCredentials);
    } catch (e) {
      print(e);
    }
    print(session?.getAccessToken().getJwtToken());
  }

  Future<void> getUserAttributes(String email, String password) async {
    final cognitoUser = CognitoUser(email, userPool);
    List<CognitoUserAttribute>? attributes;
    try {
      attributes = await cognitoUser.getUserAttributes();
    } catch (e) {
      print(e);
    }
    attributes?.forEach((attribute) {
      print('attribute ${attribute.getName()} has value ${attribute.getValue()}');
    });
  }
}
