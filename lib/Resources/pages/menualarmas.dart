import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

import '../util/colors.dart';
import 'newalarm.dart';

class MenuAlarmas extends StatefulWidget {
  const MenuAlarmas({Key? key}) : super(key: key);

  @override
  State<MenuAlarmas> createState() => _MenuAlarmasState();
}

class _MenuAlarmasState extends State<MenuAlarmas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ALARMA"),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ImageIcon(AssetImage('assets/images/siembra.png')),
                    Container(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        'Alarma de Siembra',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NewAlarm(AlarmType: "ALARMA SIEMBRA")));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 16,
            ),
            Center(
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ImageIcon(AssetImage('assets/images/cosecha.png')),
                    Container(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        'Alarma de Cosecha',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NewAlarm(AlarmType: "ALARMA COSECHA")));
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 16,
            ),
            Center(
              child:  ElevatedButton(
                onPressed: () {
                  FlutterAlarmClock.showAlarms();
                },
                child: const Text(
                  "Ver alarmas",
                  style: TextStyle(fontSize: 17.0),
                )),
            )
          ],
        ));
  }
}
