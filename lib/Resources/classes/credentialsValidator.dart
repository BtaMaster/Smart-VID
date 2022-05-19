import 'package:fluttertoast/fluttertoast.dart';

class CredentialValidator {
  bool validateSignup(String email, String password, String name) {
    bool isValid = true;
    String missingFields =
        "Debe completar los siguientes campos obligatoriamente: ";
    if (name.isEmpty) {
      isValid = false;
      missingFields += "Name ";
    }
    if (email.isEmpty) {
      isValid = false;
      missingFields += "Email ";
    }
    if (password.isEmpty) {
      isValid = false;
      missingFields += "Password ";
    }
    if (missingFields !=
        "Debe completar los siguientes campos obligatoriamente: ") {
      isValid = false;
      Fluttertoast.showToast(msg: missingFields);
    }
    if (!RegExp(
            r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$")
        .hasMatch(email)) {
      isValid = false;
      Fluttertoast.showToast(msg: "Email es inválido.");
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      isValid = false;
      Fluttertoast.showToast(
          msg:
              "La contraseña debe tener al menos 1 mayúscula, 1 minúscula, 1 valor numérico, y 1 carácter especial.");
    }
    return isValid;
  }

  bool validateLogin(String email, String password) {
    bool isValid = true;
    String missingFields =
        "Debe completar los siguientes campos obligatoriamente: ";
    if (email.isEmpty) {
      isValid = false;
      missingFields += "Email ";
    }
    if (password.isEmpty) {
      isValid = false;
      missingFields += "Password ";
    }
    if (missingFields !=
        "Debe completar los siguientes campos obligatoriamente: ") {
      isValid = false;
      Fluttertoast.showToast(msg: missingFields);
    }
    return isValid;
  }

  bool validateEmail(String email) {
    bool isValid = true;
    String missingFields =
        "Debe completar los siguientes campos obligatoriamente: ";
    if (email.isEmpty) {
      isValid = false;
      missingFields += "Email ";
    }
    if (!RegExp(
            r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$")
        .hasMatch(email)) {
      isValid = false;
      Fluttertoast.showToast(msg: "Email es inválido.");
    }
    if (missingFields !=
        "Debe completar los siguientes campos obligatoriamente: ") {
      isValid = false;
      Fluttertoast.showToast(msg: missingFields);
    }
    return isValid;
  }

  bool validatePassword(String password) {
    bool isValid = true;
    String missingFields =
        "Debe completar los siguientes campos obligatoriamente: ";
    if (password.isEmpty) {
      isValid = false;
      missingFields += "Password ";
    }
    if (missingFields !=
        "Debe completar los siguientes campos obligatoriamente: ") {
      isValid = false;
      Fluttertoast.showToast(msg: missingFields);
    }
     if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      isValid = false;
      Fluttertoast.showToast(
          msg:
              "La contraseña debe tener al menos 1 mayúscula, 1 minúscula, 1 valor numérico, y 1 carácter especial.");
    }
    return isValid;
  }
}
