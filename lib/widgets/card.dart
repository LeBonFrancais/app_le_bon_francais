import 'dart:core';
import 'package:app_le_bon_francais/pallete.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.idService,
    required this.libelle,
    this.description,
    this.date,
    this.type,
    this.nom,
    this.prenom,
    this.numDep,
  }) : super(key: key);

  final int? idService;
  final String libelle;
  final String? description;
  final String? date;
  final int? type;
  final String? nom;
  final String? prenom;
  final int? numDep;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        color: _getColor(),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.accessible_forward_sharp, size: 50),
              title: Text(_getLibelle() + " " + _getType(),
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text(
                  _getDescription() +
                      "\n" +
                      _getDate() +
                      "\n" +
                      _getPrenom() +
                      " " +
                      _getNom() +
                      "\n" +
                      _getDep().toString(),
                  style: const TextStyle(color: Colors.white)),
            ),
            ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('Voir +',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Alert(
                        context: context,
                        title: "Titre",
                        desc: "Description",
                        buttons: [
                          DialogButton(
                              child: const Text(
                                "Reserver",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {},
                              gradient: const LinearGradient(
                                  colors: [Palette.redDark, Palette.darkBlue])),
                          DialogButton(
                            child: const Text(
                              "Fermer",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: const Color.fromRGBO(0, 179, 20, 1.0),
                          ),
                        ],
                      ).show();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory CardWidget.fromJson(Map<String, dynamic> json) {
    return CardWidget(
      idService: json['idService'],
      libelle: json['libelle'],
      description: json['description'],
      date: json['date'],
      type: json['type'],
      nom: json['nom'],
      prenom: json['prenom'],
      numDep: json['numDep'],
    );
  }
  _getLibelle() => libelle;

  _getDescription() => description;

  _getDate() => date;

  _getPrenom() => prenom;

  _getNom() => nom;

  _getDep() => numDep;

  // ignore: unused_element
  _getIdService() => idService;

  _getColor() {
    if (type == 0) {
      return Palette.darkBlue;
    } else {
      return Palette.redDark;
    }
  }

  _getType() {
    if (type == 0) {
      return 'Demande';
    } else {
      return 'Proposition';
    }
  }
}
