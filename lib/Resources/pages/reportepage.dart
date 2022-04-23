import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/services.dart';

import '../classes/monitoring_data.dart';
import '../services/monitoring_services.dart';
import '../util/colors.dart';

class ReportePage extends StatefulWidget {
  const ReportePage({Key? key}) : super(key: key);

  @override
  _ReportePageState createState() => _ReportePageState();
}

class _ReportePageState extends State<ReportePage> {

  final MonitoringServices _monitoringServices = MonitoringServices();
  late DateTime today;
  late DateTime startDate;
  late DateTime lastDate;
  int selected = 1;
  var AxisFecha =  DateTimeAxis();

  @override
  void initState() {
    today = DateTime.now();
    startDate = today.subtract(const Duration(days: 1));
    lastDate = today;
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  selectOption(int newValue){
    setState((){
      selected = newValue;
      today = DateTime.now();
      switch(newValue){
        case 0:
          lastDate = today;
          startDate = today.subtract(const Duration(hours: 1));
          break;
        case 1:
          lastDate = today;
          startDate = today.subtract(const Duration(days: 1));
          break;
        case 2:
          lastDate = today;
          startDate = today.subtract(const Duration(days: 7));
          break;
        case 3:
          lastDate = today;
          startDate = today.subtract(const Duration(days: 30));
          break;
      }
      print(startDate);
      print(lastDate);
    });
  }

  List<LineSeries<MonitoringData, DateTime>> _getDefaultLineSeries(List<MonitoringData> chartData) {
    return <LineSeries<MonitoringData, DateTime>>[
      LineSeries<MonitoringData, DateTime>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Humedad Suelo',
        xValueMapper: (MonitoringData data, _) => data.time,
        yValueMapper: (MonitoringData data, _) => data.payload!.floorHumidity,
      ),
      LineSeries<MonitoringData, DateTime>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Humedad Relativa',
        xValueMapper: (MonitoringData data, _) => data.time,
        yValueMapper: (MonitoringData data, _) => data.payload!.relativeHumidity,
      ),
      LineSeries<MonitoringData, DateTime>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (MonitoringData data, _) => data.time,
        yValueMapper: (MonitoringData data, _) => data.payload!.solarLuminosity,
        width: 2,
        name: 'Luminosidad solar',
      ),
      LineSeries<MonitoringData, DateTime>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (MonitoringData data, _) => data.time,
        yValueMapper: (MonitoringData data, _) => data.payload!.floorTemperature,
        width: 2,
        name: 'Temperatura Suelo',
      ),
      LineSeries<MonitoringData, DateTime>(
        animationDuration: 2500,
        dataSource: chartData,
        width: 2,
        name: 'Temperatura Relativa',
        xValueMapper: (MonitoringData data, _) => data.time,
        yValueMapper: (MonitoringData data, _) => data.payload!.relativeTemperature,
        //dataLabelSettings:const DataLabelSettings(isVisible : true)
      )
    ];
  }



  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.12,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child: Text('Gráfico de lineas Tiempo vs Parametros Meteorológicos', style: TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold),)),
                  FutureBuilder<List<MonitoringData>>(
                      future: _monitoringServices.getMonitoringDataList(DateFormat("yyyy-MM-ddTHH:mm:ss").format(startDate), DateFormat("yyyy-MM-ddTHH:mm:ss").format(lastDate)),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          return Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                height: screenSize.height * 0.7,
                                width: screenSize.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SfCartesianChart(
                                  plotAreaBackgroundColor: Colors.white,
                                  plotAreaBorderWidth: 0,
                                  zoomPanBehavior: ZoomPanBehavior(enablePanning: true, enablePinching: true),
                                  legend: Legend(
                                      textStyle: TextStyle(color: Colors.black),
                                      position: LegendPosition.left,
                                      isVisible: true,
                                      overflowMode: LegendItemOverflowMode.wrap),
                                 //primaryXAxis: AxisFecha,
                                  primaryXAxis: DateTimeAxis(
                                      labelAlignment: LabelAlignment.start,
                                      minimum: startDate,
                                      maximum: lastDate,
                                      labelRotation: -75,
                                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                                      labelStyle: const TextStyle(color: Colors.black, fontSize: 10),
                                      majorGridLines: const MajorGridLines(width: 0),
                                  ),
                                  primaryYAxis: NumericAxis(
                                    //maximum: 100,
                                      minimum: -5,
                                      labelFormat: '{value}',
                                      interval: 1,
                                      axisLine: const AxisLine(width: 0),
                                      labelStyle: const TextStyle(color: Colors.black, fontSize: 10),
                                      majorTickLines: const MajorTickLines(color: Colors.transparent)),
                                  series: _getDefaultLineSeries(snapshot.data!),
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                ),
                              ),
                              Visibility(
                                visible: snapshot.data!.isEmpty,
                                child: Positioned(
                                  top: 50,
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(Radius.circular(25.0))
                                      ),
                                      child: Text('No hay datos en este rango', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),)),
                                ),
                              )
                            ],
                          );
                        }
                        else{
                          return const Center(child: CupertinoActivityIndicator(color: Colors.white,));
                        }
                      }
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar (
                      radius: 20,
                      backgroundColor: selected == 0 ? Colors.greenAccent : Colors.red ,
                      child:  InkWell(
                          onTap: (){
                            selectOption(0);
                          },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Hora'),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: selected == 1 ? Colors.greenAccent : Colors.red,
                      child: InkWell(
                          onTap: (){
                            selectOption(1);
                          },),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Dia')
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: selected == 2 ? Colors.greenAccent : Colors.red,
                      child: InkWell(
                          onTap: () {
                            selectOption(2);
                          },),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Semana')
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar (
                      radius: 20,
                      backgroundColor: selected == 3 ? Colors.greenAccent : Colors.red,
                      child: InkWell(
                        onTap: () {
                          selectOption(3);
                        },),
                    ),
                    const SizedBox(width: 5,),
                    const Text('Mes')
                  ],
                ),
              ],
            )
          ],
        )
    );
  }
}
