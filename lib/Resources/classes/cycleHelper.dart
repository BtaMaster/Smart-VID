import 'package:intl/intl.dart';

class CycleHelper {
  final cycles = [
    "Poda",
    "Brotación",
    "Floración",
    "Fructificación",
    "Maduración",
    "Envero",
    "Cosecha"
  ];
  final reproductiveCycles = [
    ["20220515", "20220615"], //16 de Mayo a 15 de Junio
    ["20220616", "20220715"], // 16 de Junio a 15 de Julio
    ["20220716", "20220815"], // 16 de Julio a 15 de Agosto
    ["20220816", "20220915"], // 16 de Agosto a 15 de Septiembre
    ["20220916", "20221031"], // 16 de Septiembre a 31 de Octubre
    ["20220915", "20221015"], // 15 de Septiembre a 15 de Octubre
    ["20221016", "20221115"] // 16 de Octubre al 15 de noviembre
  ];

  final relativeTemps = [
    [null, null],
    [14.00, 25.00],
    [26.00, 30.00],
    [26.00, 30.00],
    [26.00, 30.00],
    [26.00, 30.00],
    [null, null],
  ];

  final relativeHumities = [
    [null, null],
    [60, 70],
    [60, 70],
    [60, 70],
    [60, 70],
    [60, 70],
    [null, null],
  ];

  final floorTemps = [
    [null, null],
    [25.00, 30.00],
    [25.00, 30.00],
    [25.00, 30.00],
    [25.00, 30.00],
    [25.00, 30.00],
    [null, null],
  ];

  final floorHumities = [
    [null, null],
    [35, 45],
    [35, 45],
    [35, 45],
    [35, 45],
    [35, 45],
    [null, null],
  ];

  final luminocities = [
    [null, null],
    [40000, 80000],
    [40000, 80000],
    [40000, 80000],
    [40000, 80000],
    [40000, 80000],
    [null, null],
  ];

  List<double?> getRelativeTemps(String cycle) {
    var index = cycles.indexOf(cycle);
    if (index == -1) {
      return [null, null];
    } else {
      return relativeTemps[index];
    }
  }

  List<int?> getRelativeHumities(String cycle) {
    var index = cycles.indexOf(cycle);
     if (index == -1) {
      return [null, null];
    } else {
      return relativeHumities[index];
    }
  }

  List<double?> getFloorTemps(String cycle) {
    var index = cycles.indexOf(cycle);
       if (index == -1) {
      return [null, null];
    } else {
      return floorTemps[index];
    }
  }

  List<int?> getFloorHumities(String cycle) {
    var index = cycles.indexOf(cycle);
       if (index == -1) {
      return [null, null];
    } else {
      return floorHumities[index];
    }
  }

  List<int?> getLuminosities(String cycle) {
    var index = cycles.indexOf(cycle);
       if (index == -1) {
      return [null, null];
    } else {
      return luminocities[index];
    }
  }

  String? getCurrentCycle(String dateString) {
    DateTime date = DateTime.parse(dateString);
    for (var i = 0; i < 5; i++) {
      DateTime start = DateTime.parse(reproductiveCycles[i][0]);
      DateTime end = DateTime.parse(reproductiveCycles[i][1]);
      if (date.isAfter(start) && date.isBefore(end)) {
        return cycles[i];
      }
    }
    return "POR EMPEZAR";
  }
}
