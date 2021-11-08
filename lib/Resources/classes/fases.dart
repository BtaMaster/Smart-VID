class Fase {
  final String faseActual;
  final int diasTranscurridos;
  final int diasFaltantes;
  final String siguienteFase;
  Fase(
      {required this.faseActual,
      required this.diasTranscurridos,
      required this.diasFaltantes,
      required this.siguienteFase});
}

class FaseReposoInvernal extends Fase {
  FaseReposoInvernal(
      {required int diasTranscurridos, required int diasFaltantes})
      : super(
            faseActual: "Reposo Invernal",
            diasTranscurridos: diasTranscurridos,
            diasFaltantes: diasFaltantes,
            siguienteFase: "Crecimiento de los organos");
}

class FaseLloros extends Fase {
  FaseLloros({required int diasTranscurridos, required int diasFaltantes})
      : super(
            faseActual: "Lloros",
            diasTranscurridos: diasTranscurridos,
            diasFaltantes: diasFaltantes,
            siguienteFase: "Desborre");
}

class FaseCrecimientoDeOrganos extends Fase {
  FaseCrecimientoDeOrganos(
      {required int diasTranscurridos, required int diasFaltantes})
      : super(
            faseActual: "Crecimiento de los organos reproductivos",
            diasTranscurridos: diasTranscurridos,
            diasFaltantes: diasFaltantes,
            siguienteFase: "");
}

class FaseBrotamiento extends Fase {
  FaseBrotamiento({required int diasTranscurridos, required int diasFaltantes})
      : super(
            faseActual: "Brotamiento",
            diasTranscurridos: diasTranscurridos,
            diasFaltantes: diasFaltantes,
            siguienteFase: "Floracion");
}
