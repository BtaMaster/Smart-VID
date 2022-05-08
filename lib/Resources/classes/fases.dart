class Fase {
  final String faseActual;
  final int diasTranscurridos;
  final int diasFaltantes;
  final String siguienteFase;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  Fase(
      {required this.faseActual,
      required this.diasTranscurridos,
      required this.diasFaltantes,
      required this.siguienteFase,
      required this.fechaInicio,
      required this.fechaFin});
}

/* Ciclo Vegetativo */
/* Primer Nivel */

class FaseNula extends Fase {
  FaseNula()
      : super(
            faseActual: "Sin fase",
            fechaInicio: DateTime.now(),
            fechaFin: DateTime.now(),
            diasTranscurridos: 0,
            diasFaltantes: 0,
            siguienteFase: "Sin Fase");
}

class FaseReposoInvernal extends Fase {
  FaseReposoInvernal()
      : super(
            faseActual: "Reposo Invernal",
            fechaInicio: DateTime.now().month == 12 ? DateTime(DateTime.now().year, 12, 1) : DateTime(DateTime.now().year-1, 12, 1),
            fechaFin: DateTime.now().month == 12 ? DateTime(DateTime.now().year + 1, 4, 30) : DateTime(DateTime.now().year, 4, 30),
            diasTranscurridos: DateTime.now().difference(DateTime.now().month == 12 ? DateTime(DateTime.now().year, 12, 1) : DateTime(DateTime.now().year-1, 12, 1)).inDays,
            diasFaltantes: (DateTime.now().month == 12 ? DateTime(DateTime.now().year + 1, 4, 30) : DateTime(DateTime.now().year, 4, 30)).difference(DateTime.now()).inDays,
            siguienteFase: "Crecimiento de los Organos Vegetativos");
}

class FaseCrecimientoOrganosVegetativos extends Fase {
  FaseCrecimientoOrganosVegetativos()
      : super(
            faseActual: "Crecimiento de los Organos Vegetativos",
            fechaInicio: DateTime(DateTime.now().year, 5, 1),
            fechaFin: DateTime(DateTime.now().year, 9, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 5, 1)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 9, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Agostamiento");
}

class FaseAgostamiento extends Fase {
  FaseAgostamiento()
      : super(
            faseActual: "Agostamiento",
            fechaInicio: DateTime(DateTime.now().year, 9, 16),
            fechaFin: DateTime(DateTime.now().year, 11, 31),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 9, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 11, 31).difference(DateTime.now()).inDays,
            siguienteFase: "Fin de Ciclo Vegetativo");
}

/* Segundo Nivel */
class FaseLloros extends Fase {
  FaseLloros()
      : super(
            faseActual: "Lloros",
            fechaInicio: DateTime(DateTime.now().year, 2, 1),
            fechaFin: DateTime(DateTime.now().year, 3, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 2, 1)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 3, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Desborre");
}

class FaseDesborre extends Fase {
  FaseDesborre()
      : super(
            faseActual: "Desborre",
            fechaInicio: DateTime(DateTime.now().year, 3, 16),
            fechaFin: DateTime(DateTime.now().year, 5, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 3, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 5, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Parada de Crecimiento");
}

class FaseParadaCrecimiento extends Fase {
  FaseParadaCrecimiento()
      : super(
            faseActual: "Parada de Crecimiento",
            fechaInicio: DateTime(DateTime.now().year, 7, 15),
            fechaFin: DateTime(DateTime.now().year, 9, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 7, 15)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 9, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Caída de Hojas");
}

class FaseCaidaHojas extends Fase {
  FaseCaidaHojas()
      : super(
            faseActual: "Caída de Hojas",
            fechaInicio: DateTime(DateTime.now().year, 11, 15),
            fechaFin: DateTime(DateTime.now().year, 12, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 11, 15)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 12, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Fin de Ciclo Vegetativo");
}

/* Ciclo Reproductivo */
/* Primer Nivel */

class FasePoda extends Fase {
  FasePoda()
      : super(
            faseActual: "Poda",
            fechaInicio: DateTime(DateTime.now().year, 5, 15),
            fechaFin: DateTime(DateTime.now().year, 6, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 5, 15)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 6, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Brotación");
}

class FaseBrotacion extends Fase {
  FaseBrotacion()
      : super(
            faseActual: "Brotación",
            fechaInicio: DateTime(DateTime.now().year, 6, 16),
            fechaFin: DateTime(DateTime.now().year, 7, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 6, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 7, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Floración");
}

class FaseFloracion extends Fase {
  FaseFloracion()
      : super(
            faseActual: "Floración",
            fechaInicio: DateTime(DateTime.now().year, 7, 16),
            fechaFin: DateTime(DateTime.now().year, 8, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 7, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 8, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Fructificación");
}

class FaseFructificacion extends Fase {
  FaseFructificacion()
      : super(
            faseActual: "Fructificación",
            fechaInicio: DateTime(DateTime.now().year, 8, 16),
            fechaFin: DateTime(DateTime.now().year, 9, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 8, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 9, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Maduración");
}

class FaseMaduracion extends Fase {
  FaseMaduracion()
      : super(
            faseActual: "Maduración",
            fechaInicio: DateTime(DateTime.now().year, 9, 16),
            fechaFin: DateTime(DateTime.now().year, 10, 31),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 9, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 10, 31).difference(DateTime.now()).inDays,
            siguienteFase: "Fin De Ciclo Reproductivo");
}

/* Segundo Nivel */

class FaseEnvero extends Fase {
  FaseEnvero()
      : super(
            faseActual: "Envero",
            fechaInicio: DateTime(DateTime.now().year, 9, 15),
            fechaFin: DateTime(DateTime.now().year, 10, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 9, 15)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 10, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Cosecha");
}

class FaseCosecha extends Fase {
  FaseCosecha()
      : super(
            faseActual: "Cosecha",
            fechaInicio: DateTime(DateTime.now().year, 10, 16),
            fechaFin: DateTime(DateTime.now().year, 11, 15),
            diasTranscurridos: DateTime.now().difference(DateTime(DateTime.now().year, 10, 16)).inDays,
            diasFaltantes: DateTime(DateTime.now().year, 11, 15).difference(DateTime.now()).inDays,
            siguienteFase: "Fin De Ciclo Reproductivo");
}