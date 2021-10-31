import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TemperaturaDelSueloPage extends StatefulWidget {
  const TemperaturaDelSueloPage({Key? key}) : super(key: key);

  @override
  _TemperaturaDelSueloPageState createState() =>
      _TemperaturaDelSueloPageState();
}

class _TemperaturaDelSueloPageState extends State<TemperaturaDelSueloPage> {
  //PublishSubject<double> eventObservable = new PublishSubject();
  double temperatura = 70.0;
  double thicknessTemp = 35.0;
  String fasereproductivaActual = "FRUCTIFICACIÓN";
  double temperaturaminimaoptima = 10.0;
  double temperaturamaximaoptima = 21.0;
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
