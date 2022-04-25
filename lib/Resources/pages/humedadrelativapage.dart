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

class HumedadRelativaPage extends StatefulWidget {
  const HumedadRelativaPage({Key? key}) : super(key: key);

  @override
  _HumedadRelativaPageState createState() => _HumedadRelativaPageState();
}

class _HumedadRelativaPageState extends State<HumedadRelativaPage> {

  double humedad = 70.0;
  double thicknessMeter = 35.0;
  String fasereproductivaActual = "FRUCTIFICACIÓN";
  String humedadminimaoptima = "10.0";
  String humedadmaximaoptima = "21.0";
  var data;

 @override
  void initState() {
    super.initState();
    getMostRecentHumd().then((value) => setState(() {
          humedad = double.parse(value);
        }));
    getMostRecentTime().then((value) => setState(() {
          fasereproductivaActual = cycleHelper.getCurrentCycle(value)!;
          getHumdRange();
        }));
    WidgetsBinding.instance?.addPostFrameCallback((_) async => {subscribe()});
  }

  void getHumdRange() {
    var range = cycleHelper.getRelativeHumities(fasereproductivaActual);
    setState(() {
      if (range[0] == null && range[1] == null) {
        humedadminimaoptima = "-";
        humedadmaximaoptima = "-";
      } else {
        humedadminimaoptima = range[0].toString();
        humedadmaximaoptima = range[1].toString();
      }
    });
  }

  Future<String> getMostRecentHumd() async {
    var humedades = await AwsAppsyncRepository().listHumedRelativa() ?? "";
    print("humedades: " + humedades.toString());
    var lastHumed = json.decode(humedades)["listSensorHumedRelativas"]["items"];
    print("last " + lastHumed[0].toString());
    return (lastHumed[0]["humedadRelativa"]);
  }

  Future<String> getMostRecentTime() async {
    var humedades = await AwsAppsyncRepository().listHumedRelativa() ?? "";
    var lastTemp = json.decode(humedades)["listSensorHumedRelativas"]["items"];
    return (lastTemp[0]["Tiempo"]);
  }

  Future<void> subscribe() async {
    String graphQLDocument = '''subscription subscribeHumdRelativa {
      onCreateSensorHumedRelativa {
        Tiempo
        humedadRelativa
      }
    }
    ''';
    final Stream<GraphQLResponse<String>> operation = Amplify.API.subscribe(
      GraphQLRequest<String>(document: graphQLDocument),
      onEstablished: () => print('Subscription established'),
    );

    final StreamSubscription<GraphQLResponse<String>> subscription =
        operation.listen(
      (event) {
        data = event.data;

        setState(() {
          humedad = double.parse(
              json.decode(data)["onCreateSensorHumedRelativa"]["humedadRelativa"]);
        });
      },
      onError: (Object e) => print('Error in subscription stream: $e'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HUMEDAD RELATIVA',
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
                        minimum: 0,
                        maximum: 100,
                        startAngle: 160,
                        labelFormat: '{value} %',
                        endAngle: 20,
                        axisLineStyle: AxisLineStyle(
                          thickness: thicknessMeter,
                        ),
                        pointers: [
                          NeedlePointer(value: humedad, enableAnimation: true)
                        ],
                        ranges: [
                          GaugeRange(
                            startValue: 0,
                            endValue: 20,
                            color: Colors.yellow[700],
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 20,
                            endValue: 40,
                            color: Colors.orange,
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 40,
                            endValue: 60,
                            color: Colors.deepOrange,
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 60,
                            endValue: 80,
                            color: Colors.red[600],
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 80,
                            endValue: 100,
                            color: Colors.red[700],
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          // GaugeRange(
                          //   startValue: 80,
                          //   endValue: 100,
                          //   color: Colors.red[900],
                          //   startWidth: thicknessMeter,
                          //   endWidth: thicknessMeter,
                          // ),
                        ],
                        annotations: [
                          GaugeAnnotation(
                              widget: Text(
                                humedad.toString() + ' %',
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
                      'Humedad Minima Óptima:   $humedadminimaoptima %',
                      style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )),
                    const Spacer(),
                    Flexible(
                        child: Text(
                      'Humedad Máxima Óptima:   $humedadmaximaoptima %',
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
