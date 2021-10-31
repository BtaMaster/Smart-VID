import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HumedadRelativaPage extends StatefulWidget {
  const HumedadRelativaPage({Key? key}) : super(key: key);

  @override
  _HumedadRelativaPageState createState() => _HumedadRelativaPageState();
}

class _HumedadRelativaPageState extends State<HumedadRelativaPage> {
  //PublishSubject<double> eventObservable = new PublishSubject();
  double humedad = 70.0;
  double thicknessMeter = 35.0;
  String fasereproductivaActual = "FRUCTIFICACIÓN";
  double humedadminimaoptima = 10.0;
  double humedadmaximaoptima = 21.0;
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
