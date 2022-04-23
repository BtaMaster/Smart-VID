import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/classes/aws_appsync.dart';
import 'package:smartvid/Resources/classes/cycleHelper.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

final appsyncRepository = AwsAppsyncRepository();
final cycleHelper = CycleHelper();

class TemperaturaDelSueloPage extends StatefulWidget {
  const TemperaturaDelSueloPage({Key? key}) : super(key: key);

  @override
  _TemperaturaDelSueloPageState createState() =>
      _TemperaturaDelSueloPageState();
}

class _TemperaturaDelSueloPageState extends State<TemperaturaDelSueloPage> {
  double temperatura = 70.0;
  double thicknessTemp = 35.0;
  String fasereproductivaActual = "FRUCTIFICACIÓN";
  String temperaturaminimaoptima = "10.0";
  String temperaturamaximaoptima = "21.0";
  var data;

  @override
  void initState() {
    super.initState();
    getMostRecentTemp().then((value) => setState(() {
          temperatura = double.parse(value);
        }));
    getMostRecentTime().then((value) => setState(() {
          fasereproductivaActual = cycleHelper.getCurrentCycle(value)!;
          getTempRange();
        }));
    WidgetsBinding.instance?.addPostFrameCallback((_) async => {subscribe()});
  }

  void getTempRange() {
    var range = cycleHelper.getRelativeTemps(fasereproductivaActual);
    setState(() {
      if (range[0] == null && range[1] == null) {
        temperaturaminimaoptima = "-";
        temperaturamaximaoptima = "-";
      } else {
        temperaturaminimaoptima = range[0].toString();
        temperaturamaximaoptima = range[1].toString();
      }
    });
  }

  Future<String> getMostRecentTemp() async {
    var temps = await AwsAppsyncRepository().listTempSuelo() ?? "";
    print("Temps: " + temps.toString());
    var lastTemp = json.decode(temps)["listSensorTempSuelos"]["items"];
    print("last temp" + lastTemp[0].toString());
    return (lastTemp[0]["temperaturaSuelo"]);
  }

  Future<String> getMostRecentTime() async {
    var temps = await AwsAppsyncRepository().listTempSuelo() ?? "";
    var lastTemp = json.decode(temps)["listSensorTempSuelos"]["items"];
    return (lastTemp[0]["Tiempo"]);
  }

  Future<void> subscribe() async {
    String graphQLDocument = '''subscription subscribeTempSuelo {
      onCreateSensorTempSuelo {
        Tiempo
        temperaturaSuelo
      }
    }''';
    final Stream<GraphQLResponse<String>> operation = Amplify.API.subscribe(
      GraphQLRequest<String>(document: graphQLDocument),
      onEstablished: () => print('Subscription established'),
    );

    final StreamSubscription<GraphQLResponse<String>> subscription =
        operation.listen(
      (event) {
        data = event.data;

        setState(() {
          temperatura = double.parse(
              json.decode(data)["onCreateSensorTempSuelo"]["temperaturaSuelo"]);
        });
      },
      onError: (Object e) => print('Error in subscription stream: $e'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TEMPERATURA DEL SUELO',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: Column(
          children: <Widget>[
            Flexible(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 4500,
                    axes: [
                      RadialAxis(
                        minimum: -20,
                        maximum: 100,
                        startAngle: 160,
                        labelFormat: '{value} °C',
                        endAngle: 20,
                        axisLineStyle: AxisLineStyle(
                          thickness: thicknessTemp,
                        ),
                        pointers: [
                          NeedlePointer(
                              value: temperatura, enableAnimation: true)
                        ],
                        ranges: [
                          GaugeRange(
                            startValue: -20,
                            endValue: 0,
                            color: Colors.yellow[700],
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                          GaugeRange(
                            startValue: 0,
                            endValue: 20,
                            color: Colors.orange,
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                          GaugeRange(
                            startValue: 20,
                            endValue: 40,
                            color: Colors.deepOrange,
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                          GaugeRange(
                            startValue: 40,
                            endValue: 60,
                            color: Colors.red[600],
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                          GaugeRange(
                            startValue: 60,
                            endValue: 80,
                            color: Colors.red[700],
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                          GaugeRange(
                            startValue: 80,
                            endValue: 100,
                            color: Colors.red[900],
                            startWidth: thicknessTemp,
                            endWidth: thicknessTemp,
                          ),
                        ],
                        annotations: [
                          GaugeAnnotation(
                              widget: Text(
                                temperatura.toString() + ' °C',
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              positionFactor: 0.5,
                              angle: 90)
                        ],
                      )
                    ],
                  ),
                )),
            const Spacer(flex: 1),
            Flexible(
                flex: 1,
                child: Text(
                  "Fase Fenológica Reproductiva actual:",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )),
            const Spacer(flex: 1),
            Flexible(
                flex: 1,
                child: Text(
                  fasereproductivaActual,
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: fasereproductivaActual == "FRUCTIFICACIÓN"
                          ? Colors.lightGreenAccent[400]
                          : Colors.white,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )),
            const Spacer(flex: 2),
            Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                      'Temperatura Minima Óptima:   $temperaturaminimaoptima °C',
                      style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )),
                    const Spacer(),
                    Flexible(
                        child: Text(
                      'Temperatura Máxima Óptima:   $temperaturamaximaoptima °C',
                      style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                ))
          ],
        ));
  }
}
