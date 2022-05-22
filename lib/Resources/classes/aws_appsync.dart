// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

import '../../models/SensorHumedRelativa.dart';
import '../../models/SensorTempRelativa.dart';
import '../../models/SensorTempSuelo.dart';
import '../../models/Todo.dart';

class AwsAppsyncRepository {
  Future<String?> listHumedRelativa() async {
    try {
      final request = ModelQueries.list(SensorHumedRelativa.classType);
      String graphQLDocument = '''query listHumedRelativa {
  listSensorHumedRelativas (limit: 1000000){
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
  listSensorHumedSuelos (limit: 1000000){
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
  listSensorLuminosidads (limit: 1000000){
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
        listSensorTempRelativas(limit: 1000000) {
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
      print(temps?.length.toString());
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
  listSensorTempSuelos (limit: 1000000) {
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

  Future<dynamic?> getMostRecentValue(list) async {
    var date1;
    var date2;

    final value = list.reduce((a, b) {
      date1 = DateTime.parse(a["Tiempo"].toString());
      date2 = DateTime.parse(b["Tiempo"].toString());
      return date1.compareTo(date2) < 0 ? b : a;
    });

    return value;
  }
}
