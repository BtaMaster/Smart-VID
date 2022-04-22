import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartvid/Resources/util/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../classes/monitoring_data.dart';
import '../services/monitoring_services.dart';

class MonitoreoPage extends StatefulWidget {
  const MonitoreoPage({Key? key}) : super(key: key);

  @override
  _MonitoreoPageState createState() => _MonitoreoPageState();
}

class _MonitoreoPageState extends State<MonitoreoPage> {

  final MonitoringServices _monitoringServices = MonitoringServices();
  late DateTime today;
  late DateTime startDate;
  late DateTime lastDate;

  @override
  void initState() {
    today = DateTime.now();
    startDate = today;
    lastDate = today.add(const Duration(days: 1));
    super.initState();
  }



  List<LineSeries<MonitoringData, String>> _getDefaultLineSeries(List<MonitoringData> chartData) {
    return <LineSeries<MonitoringData, String>>[
      LineSeries<MonitoringData, String>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Humedad Suelo',
        xValueMapper: (MonitoringData data, _) => data.time!.substring(0, 10),
        yValueMapper: (MonitoringData data, _) => data.payload!.floorHumidity,),
      LineSeries<MonitoringData, String>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Humedad Relativa',
        xValueMapper: (MonitoringData data, _) => data.time!.substring(0, 10),
        yValueMapper: (MonitoringData data, _) => data.payload!.relativeHumidity,),
      LineSeries<MonitoringData, String>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (MonitoringData data, _) => data.time!.substring(0, 10),
        yValueMapper: (MonitoringData data, _) => data.payload!.solarLuminosity,
        width: 2,
        name: 'Luminosidad solar',),
      LineSeries<MonitoringData, String>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (MonitoringData data, _) => data.time!.substring(0, 10),
          yValueMapper: (MonitoringData data, _) => data.payload!.floorTemperature,
          width: 2,
          name: 'Temperatura Suelo',),
      LineSeries<MonitoringData, String>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          name: 'Temperatura Relativa',
          xValueMapper: (MonitoringData data, _) => data.time!.substring(0, 10),
          yValueMapper: (MonitoringData data, _) => data.payload!.relativeTemperature,)
    ];
  }


  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('MONITOREO',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenSize.height * 0.5,
              child: FutureBuilder<List<MonitoringData>>(
                future: _monitoringServices.getMonitoringDataList(DateFormat("yyyy-MM-dd").format(startDate), DateFormat("yyyy-MM-dd").format(lastDate)),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return SfCartesianChart(
                      plotAreaBackgroundColor: Colors.white,
                      plotAreaBorderWidth: 0,
                      zoomPanBehavior: ZoomPanBehavior(enablePanning: true, enablePinching: true),
                      title: ChartTitle(text: 'Gráfico de lineas Tiempo vs Parametros Meteorológicos', textStyle: TextStyle(color: Colors.white, fontSize: 12)),
                      legend: Legend(
                          textStyle: TextStyle(color: Colors.white),
                          position: LegendPosition.bottom,
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      primaryXAxis: CategoryAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          labelStyle: const TextStyle(color: Colors.white),
                          majorGridLines: const MajorGridLines(width: 0)),
                      primaryYAxis: NumericAxis(
                          //maximum: 100,
                          minimum: -5,
                          labelFormat: '{value}',
                          interval: 1,
                          axisLine: const AxisLine(width: 0),
                          labelStyle: const TextStyle(color: Colors.white),
                          majorTickLines: const MajorTickLines(color: Colors.transparent)),
                      series: _getDefaultLineSeries(snapshot.data!),
                      tooltipBehavior: TooltipBehavior(enable: true),
                    );
                  }
                  else{
                    return const Center(child: CupertinoActivityIndicator());
                  }
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    InkWell(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                        )),
                    SizedBox(width: 5,),
                    Text('Hora')
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          startDate = today.subtract(const Duration(days: 1));
                        });
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.red,
                      )),
                    const SizedBox(width: 5,),
                    const Text('Dia')
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            startDate = today.subtract(const Duration(days: 7));
                          });
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                        )),
                    const SizedBox(width: 5,),
                    const Text('Semana')
                  ],
                ),
                Row(
                  children: const [
                    InkWell(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                        )),
                    SizedBox(width: 5,),
                    Text('Mes')
                  ],
                ),
              ],
            )
          ],
        )
    );
  }
}
