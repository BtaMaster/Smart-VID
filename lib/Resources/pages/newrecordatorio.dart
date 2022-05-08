import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartvid/Resources/pages/menurecordatorios.dart';

import '../services/notification_api.dart';
import '../util/colors.dart';

class NewRecordatorio extends StatefulWidget {
  final String RecordatorioType;
  const NewRecordatorio({Key? key, required this.RecordatorioType}) : super(key: key);

  @override
  State<NewRecordatorio> createState() => _NewRecordatorioState();
}

class _NewRecordatorioState extends State<NewRecordatorio> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() {
    NotificationApi.onNotifications.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? event) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
    const MenuRecordatorios()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.RecordatorioType),
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
              children: const [
                SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Utilice el formato de 24 hrs."),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(9),
                child: Text(
                  'Crear Recordatorio',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              onPressed: () {
                NotificationApi.showNotification(
                  title: widget.RecordatorioType.characters.first.toUpperCase() + widget.RecordatorioType.substring(1).toLowerCase(),
                  body: nameController.text,
                  payload: 'alarma',
                );
              },
            ),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(9),
                child: Text(
                  'Crear Recordatorio Programado',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              onPressed: () {
                NotificationApi.showScheduledNotification(
                  id: Random().nextInt(10000),
                  title: widget.RecordatorioType.characters.first.toUpperCase() + widget.RecordatorioType.substring(1).toLowerCase(),
                  body: nameController.text,
                  scheduledDate: DateTime.now().add(Duration(seconds: 20)),
                  payload: 'alarma',
                );
              },
            ),
          ])),
    );
  }
}