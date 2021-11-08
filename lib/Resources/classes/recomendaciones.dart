import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Recomendacion {
  final String mensaje;
  final Widget widget;
  Recomendacion({required this.mensaje, required this.widget});
}

class RecomendacionLuminosidad extends Recomendacion {
  RecomendacionLuminosidad(String mensaje)
      : super(mensaje: mensaje, widget: const Icon(Icons.brightness_low));
}

class RecomendacionAgua extends Recomendacion {
  RecomendacionAgua(String mensaje)
      : super(mensaje: mensaje, widget: const Icon(MdiIcons.water));
}

class RecomendacionPlaga extends Recomendacion {
  RecomendacionPlaga(String mensaje)
      : super(mensaje: mensaje, widget: const Icon(Icons.bug_report));
}

class RecomendacionFollaje extends Recomendacion {
  RecomendacionFollaje(String mensaje)
      : super(mensaje: mensaje, widget: const Icon(MdiIcons.fruitGrapes));
}

class RecomendacionHongo extends Recomendacion {
  RecomendacionHongo(String mensaje)
      : super(mensaje: mensaje, widget: const Icon(MdiIcons.mushroom));
}
