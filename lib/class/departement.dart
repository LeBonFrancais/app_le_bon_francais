import 'dart:core';

class Departement {
  const Departement({
    required this.idDep,
    required this.numDep,
    required this.nomDep,
  });

  final int idDep;
  final String numDep;
  final String nomDep;

  factory Departement.fromJson(Map<String, dynamic> json) {
    return Departement(
      idDep: json['IDDEPARTEMENT'],
      numDep: json['NUMERO_DEP'],
      nomDep: json['NUM_DEP'],
    );
  }
}
