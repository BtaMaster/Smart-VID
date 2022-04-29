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

class LuminosidadPage extends StatefulWidget {
  const LuminosidadPage({Key? key}) : super(key: key);

  @override
  _LuminosidadPageState createState() => _LuminosidadPageState();
}

class _LuminosidadPageState extends State<LuminosidadPage> {
  //PublishSubject<double> eventObservable = new PublishSubject();
  double luminosidad = 70000.0;
  double thicknessMeter = 32.0;
  String fasereproductivaActual = "FRUCTIFICACIÓN";
  String luminosidadminimaoptima = "40000.0";
  String luminosidadmaximamaoptima = "80000.0";
  var data;

  @override
  void initState() {
    super.initState();
    getMostRecentHumd().then((value) => setState(() {
          luminosidad = double.parse(value);
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
        luminosidadminimaoptima = "-";
        luminosidadmaximamaoptima = "-";
      } else {
        luminosidadminimaoptima = range[0].toString();
        luminosidadmaximamaoptima = range[1].toString();
      }
    });
  }

  Future<String> getMostRecentHumd() async {
    var luminosidades = await AwsAppsyncRepository().listLuminosidad() ?? "";
    print("luminosidades: " + luminosidades.toString());
    var lastLum = json.decode(luminosidades)["listSensorLuminosidads"]["items"];
    print("last " + lastLum[0].toString());
    return (lastLum[0]["luminosidadSolar"]);
  }

  Future<String> getMostRecentTime() async {
    var luminosidades = await AwsAppsyncRepository().listLuminosidad() ?? "";
    var lastLum = json.decode(luminosidades)["listSensorLuminosidads"]["items"];
    return (lastLum[0]["Tiempo"]);
  }

  Future<void> subscribe() async {
    String graphQLDocument = '''subscription subscribeLuminosidad {
      onCreateSensorLuminosidad {
        Tiempo
        luminosidadSolar
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
          luminosidad = double.parse(json
              .decode(data)["onCreateSensorLuminosidad"]["luminosidadSolar"]);
        });
      },
      onError: (Object e) => print('Error in subscription stream: $e'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LUMINOSIDAD',
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
                        maximum: 100000,
                        startAngle: 160,
                        labelFormat: '{value} Lux',
                        endAngle: 20,
                        axisLineStyle: AxisLineStyle(
                          thickness: thicknessMeter,
                        ),
                        pointers: [
                          NeedlePointer(
                              value: luminosidad, enableAnimation: true)
                        ],
                        ranges: [
                          GaugeRange(
                            startValue: 0,
                            endValue: 20000,
                            color: Colors.yellow[700],
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 20000,
                            endValue: 40000,
                            color: Colors.orange,
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 40000,
                            endValue: 60000,
                            color: Colors.deepOrange,
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 60000,
                            endValue: 80000,
                            color: Colors.red[600],
                            startWidth: thicknessMeter,
                            endWidth: thicknessMeter,
                          ),
                          GaugeRange(
                            startValue: 80000,
                            endValue: 100000,
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
                                luminosidad.toString() + ' Lux',
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
                      'Luminosidad Minima Óptima:   $luminosidadminimaoptima Lux',
                      style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width / 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )),
                    const Spacer(),
                    Flexible(
                        child: Text(
                      'Luminosidad Máxima Óptima:   $luminosidadmaximamaoptima Lux',
                      style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.width / 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                ))
          ],
        ));
  }
}
