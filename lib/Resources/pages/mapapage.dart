import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaPage extends StatefulWidget {
  final LatLng point;
  final String nombre;
  const MapaPage({Key? key, required this.point, required this.nombre})
      : super(key: key);
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MAPA"),
          centerTitle: true,
        ),
        body: Container(
            child: FlutterMap(
          options: MapOptions(
            center: widget.point,
            zoom: 13.0,
            interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 3,
                  point: widget.point,
                  builder: (ctx) => Column(
                    children: [
                      Icon(Icons.place,
                          color: Colors.red,
                          size: MediaQuery.of(context).size.width / 6),
                      Icon(Icons.memory,
                          color: Colors.black,
                          size: MediaQuery.of(context).size.width / 12),
                      Text(widget.nombre)
                    ],
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
