import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartvid/Resources/util/colors.dart';

class MonitoreoPage extends StatefulWidget {
  const MonitoreoPage({Key? key}) : super(key: key);

  @override
  _MonitoreoPageState createState() => _MonitoreoPageState();
}

class _MonitoreoPageState extends State<MonitoreoPage> {
  @override
  Widget build(BuildContext context) {
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
        body: GridView.count(
          childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
              (MediaQuery.of(context).size.height / 3.75)),
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.width / 32,
          mainAxisSpacing: MediaQuery.of(context).size.height / 32,
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width / 16,
              MediaQuery.of(context).size.height / 32,
              MediaQuery.of(context).size.width / 16,
              MediaQuery.of(context).size.width / 32),
          primary: false, //para evitar scroll
          children: [
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children: [
                Flexible(
                  child: Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3),
                  flex: 6,
                ),
                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Temperatura relativa',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
              ]),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children: [
                Flexible(
                  child: Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3),
                  flex: 6,
                ),
                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Humedad relativa',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
              ]),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children: [
                Flexible(
                  child: Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3),
                  flex: 6,
                ),
                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Temperatura del suelo',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
              ]),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children: [
                Flexible(
                  child: Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3),
                  flex: 6,
                ),
                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Humedad del suelo',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
              ]),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children:
              [
                Flexible(
                  child:
                  Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3

                  ),
                  flex: 6,
                ),
                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Luminosidad Solar',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
              ]),
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Column(children: [
                Flexible(
                  child: Image(
                      image: const AssetImage("assets/images/logo.jpg"),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3),
                  flex: 6,
                ),

                const Spacer(),
                Flexible(
                    flex: 2,
                    child: Text('Dispositivos',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)
                    )),
              ]),
            ),
          ],
        ));
  }
}