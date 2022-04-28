// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../../models/SensorHumedRelativa.dart';
import '../../models/SensorTempRelativa.dart';

class AwsAppsyncRepository {

  Future<String?> listHumedRelativa() async {
    try {
      final request = ModelQueries.list(SensorHumedRelativa.classType);
      String graphQLDocument = '''query listHumedRelativa {
  listSensorHumedRelativas {
    items {
      humedadRelativa
      Tiempo
    }
  }
}''';
     final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;
      var temps = response.data;
      if (temps == null) {
        print('errors: ' + response.errors.toString());
      } else {
        print("temps is not null");
        return temps;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<String?> listHumedSuelo() async {
    try {
      String graphQLDocument = '''query listHumedSuelo {
  listSensorHumedSuelos {
    items {
      Tiempo
      humedadSuelo
    }
  }
}''';
     final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;
      var temps = response.data;
      if (temps == null) {
        print('errors: ' + response.errors.toString());
      } else {
        print("temps is not null");
        return temps;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<String?> listLuminosidad() async {
    try {
      String graphQLDocument = '''query listLuminosidad {
  listSensorLuminosidads {
    items {
      Tiempo
      luminosidadSolar
    }
  }
}''';
     final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;
      var temps = response.data;
      if (temps == null) {
        print('errors: ' + response.errors.toString());
      } else {
        print("temps is not null");
        return temps;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<String?> listTempRelativa() async {
    try {
      String graphQLDocument = '''query listTempRelativa {
        listSensorTempRelativas {
          items {
            Tiempo
            temperaturaRelativa
          }
        }
      }''';
      final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;
      var temps = response.data;
      if (temps == null) {
        print('errors: ' + response.errors.toString());
      } else {
        print("temps is not null");
        return temps;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<String?> listTempSuelo() async {
    try {
      String graphQLDocument = '''query listTempSuelo {
  listSensorTempSuelos {
    items {
      Tiempo
      temperaturaSuelo
    }
  }
}''';
      final response = await Amplify.API
          .query(request: GraphQLRequest<String>(document: graphQLDocument))
          .response;
      var temps = response.data;
      if (temps == null) {
        print('errors: ' + response.errors.toString());
      } else {
        print("temps is not null");
        return temps;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }
}
