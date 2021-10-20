import 'package:flutter/material.dart';
//Colores en formato RRGGBB
String interfaceColor = "#976DD0";
String headColor = "#573885";
String fontColor = "#FFFFFF";
String iconColor = "#000000";
String calendarColor = "#343F4B"; 
//from: https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter?rq=1
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  /// It returns a color with full range of alpha
  static int fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return int.parse(buffer.toString(), radix: 16);
  }
  static Map<int,Color> colorSwatch(Color color){
    return {
      50: Color.fromRGBO(color.red, color.green, color.blue, .1),
      100: Color.fromRGBO(color.red, color.green, color.blue, .2),
      200: Color.fromRGBO(color.red, color.green, color.blue, .3),
      300: Color.fromRGBO(color.red, color.green, color.blue, .4),
      400: Color.fromRGBO(color.red, color.green, color.blue, .5),
      500: Color.fromRGBO(color.red, color.green, color.blue, .6),
      600: Color.fromRGBO(color.red, color.green, color.blue, .7),
      700: Color.fromRGBO(color.red, color.green, color.blue, .8),
      800: Color.fromRGBO(color.red, color.green, color.blue, .9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1)
    };
  }
  //Función propia:
  static MaterialColor getMaterialColor(String hexString){
    //Obtenemos el color:
    var color = fromHex(hexString);
    return MaterialColor(color, colorSwatch(Color(color)));
  }
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
