import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
  double luminosidadminimaoptima = 40000.0;
  double luminosidadmaximamaoptima = 80000.0;
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
