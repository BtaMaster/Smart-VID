import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smartvid/Resources/pages/calendarioreproductivopage.dart';
import 'package:smartvid/Resources/util/colors.dart';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CALENDARIO"),
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
                    Icon(MdiIcons.barley),
                    Container(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        'CALENDARIO\nVEGETATIVO',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarioVegetativoPage()),
                  );
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
                    const Icon(MdiIcons.fruitGrapes),
                    Container(
                      width: MediaQuery.of(context).size.width / 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        'CALENDARIO\nREPRODUCTIVO',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onPressed: () {


                },
              ),
            ),
          ],
        ));
  }
}
