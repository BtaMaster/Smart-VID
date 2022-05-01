import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:smartvid/Resources/pages/menualarmas.dart';

import '../util/colors.dart';

class NewAlarm extends StatefulWidget {
  final String AlarmType;
  const NewAlarm({Key? key, required this.AlarmType}) : super(key: key);

  @override
  State<NewAlarm> createState() => _NewAlarmState();
}

class _NewAlarmState extends State<NewAlarm> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.AlarmType),
        centerTitle: true,
      ),
      backgroundColor: HexColor.getColorfromHex(interfaceColor),
      body: Center(
          child: Column(children: <Widget>[
        const SizedBox(height: 30),
        const Text("Nombre de la alarma:"),
        const SizedBox(height: 30),
        SizedBox(
            height: 60,
            width: 300,
            child: Column(
              children: [
                Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                    ),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                  ),
                  controller: hourController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              height: 40,
              width: 60,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: minuteController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text("Utilice el formato de 24 hrs."),
        const SizedBox(height: 30),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(9),
            child: Text(
              'Crear Alarma',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          onPressed: () {
            int hour;
            int minutes;
            hour = int.parse(hourController.text);
            minutes = int.parse(minuteController.text);
            FlutterAlarmClock.createAlarm(hour, minutes, title: nameController.text + "-" + widget.AlarmType);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuAlarmas()),
            );
          },
        ),
      ])),
    );
  }
}
