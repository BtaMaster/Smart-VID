class MonitoringData{
  Payload? payload;
  String? time;

  MonitoringData({this.payload, this.time});

  factory MonitoringData.fromJson(dynamic json) {
    Map<String, dynamic> monitoringDataJson = json;
    return MonitoringData(
        payload: Payload.fromJson(monitoringDataJson['payload']),
        time: monitoringDataJson['Tiempo']
    );
  }

}


class Payload{
  final double? floorHumidity;
  final double? solarLuminosity;
  final double? relativeHumidity;
  final double? floorTemperature;
  final double? relativeTemperature;

  Payload({this.floorHumidity, this.solarLuminosity, this.relativeHumidity, this.floorTemperature, this.relativeTemperature});

  factory Payload.fromJson(dynamic json) {
    Map<String, dynamic> payloadJson = json;
    return Payload(
      floorHumidity: payloadJson['humedadSuelo'].toDouble(),
      solarLuminosity: payloadJson['luminosidadSolar'].toDouble(),
      relativeHumidity: payloadJson['humedadRelativa'].toDouble(),
      floorTemperature: payloadJson['temperaturaSuelo'].toDouble(),
      relativeTemperature: payloadJson['temperaturaRelativa'].toDouble()
    );
  }
}