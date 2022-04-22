import 'package:dio/dio.dart';

import '../classes/monitoring_data.dart';

class MonitoringServices{

  Future<List<MonitoringData>> getMonitoringDataList(String startDate, String lastDate) async{

    final dio = Dio();

    var uri = 'https://17bcyenclj.execute-api.us-east-1.amazonaws.com/produccion/reportes';

    var response = await dio.get(uri, queryParameters: {'fechaInicio' : startDate , 'fechaFin' : lastDate});

    if(response.statusCode == 200){
      List aux = response.data.map((e) => MonitoringData.fromJson(e)).toList();
      return aux.cast<MonitoringData>();
    }

    return [];

  }


}