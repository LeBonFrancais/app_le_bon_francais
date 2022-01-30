import 'dart:core';

class CardWidget {
  const CardWidget({
    required this.idService,
    required this.libelle,
    required this.description,
    required this.date,
    required this.type,
    required this.nom,
    required this.prenom,
    required this.numDep,
  }) ;

  final int idService;
  final String libelle;
  final String description;
  final int date;
  final int type;
  final String nom;
  final String prenom;
  final String numDep;

  factory CardWidget.fromJson(Map<String, dynamic> json) {
    return CardWidget(
      idService: json['IDSERVICE'],
      libelle: json['LIBELLE'],
      description: json['DESCRIPTION'],
      date: json['IDINSCRIT'],
      type: json['RECHERCHE'],
      nom: json['NOM'],
      prenom: json['PRENOM'],
      numDep: json['NUMERO_DEP'],
    );
  }
}
