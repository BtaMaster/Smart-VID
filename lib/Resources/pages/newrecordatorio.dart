import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartvid/Resources/pages/menurecordatorios.dart';

import '../services/notification_api.dart';
import '../util/colors.dart';

class NewRecordatorio extends StatefulWidget {
  final String RecordatorioType;
  const NewRecordatorio({Key? key, required this.RecordatorioType})
      : super(key: key);

  @override
  State<NewRecordatorio> createState() => _NewRecordatorioState();
}

class _NewRecordatorioState extends State<NewRecordatorio> {
  TextEditingController nameController = TextEditingController();
  late TimeOfDay selectedTime;
  late DateTime selectedDate;
  DateTime finalDateTime = DateTime.now().add(Duration(minutes: 3));
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');

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
    /*Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MenuRecordatorios()));*/
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
        const Text("Mensaje del recordatorio:",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(height: 30),
        SizedBox(
            height: 60,
            width: 300,
            child: Column(
              children: [
                Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(color: Colors.white),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )),
        const SizedBox(height: 10),
        Text(
          dateFormat.format(finalDateTime),
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(9),
            child: Text(
              'Seleccionar Fecha y Hora',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          onPressed: () async {
            selectedDate = (await _selectDateTime(context))!;
            if (selectedDate == null) return;
            selectedTime = (await _selectTime(context))!;
            if (selectedTime == null) return;

            setState(() {
              finalDateTime = DateTime(selectedDate.year, selectedDate.month,
                  selectedDate.day, selectedTime.hour, selectedTime.minute);
            });
          },
        ),
        const SizedBox(height: 20),
        /*ElevatedButton(
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
            ),*/
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
              title: widget.RecordatorioType.characters.first.toUpperCase() +
                  widget.RecordatorioType.substring(1).toLowerCase(),
              body: nameController.text,
              scheduledDate: finalDateTime.toLocal(),
              payload: 'recordatorio',
            );
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Se ha creado el recordatorio'),
              backgroundColor: Colors.purple,
            ));
            Navigator.of(context).pop('Creado');
          },
        ),
      ])),
    );
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute+3));

  Future<DateTime?> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(seconds: 60)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
      );
}
