import 'package:flutter/material.dart';
import 'package:smartvid/Resources/pages/listrecordatorios.dart';
import 'package:smartvid/Resources/pages/newrecordatorio.dart';

import '../util/colors.dart';
import 'newalarm.dart';

class MenuRecordatorios extends StatefulWidget {
  const MenuRecordatorios({Key? key}) : super(key: key);

  @override
  State<MenuRecordatorios> createState() => _MenuRecordatoriosState();
}

class _MenuRecordatoriosState extends State<MenuRecordatorios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("RECORDATORIOS"),
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
                        'Crear Recordatorio de Siembra',
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
                          const NewRecordatorio(RecordatorioType: 'Recordatorio de Siembra',)));
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
                        'Crear Recordatorio de Cosecha',
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
                          const NewRecordatorio(RecordatorioType: 'Recordatorio de Cosecha',)));
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
                    const ImageIcon(AssetImage('assets/images/recordatorio.png')),
                    Container(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        'Listado de Recordatorios',
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
                          const ListRecordatorios()));
                },
              ),
            ),
          ],
        ));
  }

}