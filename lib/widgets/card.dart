import 'dart:core';

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    this.idService,
    this.libelle,
    this.description,
    this.date,
    this.type,
    this.nom,
    this.prenom,
    this.numDep,
  }) : super(key: key);

  final int? idService;
  final String? libelle;
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
              title: Text(_getLibelle()+" "+_getType(), style: const TextStyle(color: Colors.white)),
              subtitle:
                Text(_getDescription()+
                    "\n"+_getDate()+
                    "\n"+_getPrenom()+" "+_getNom()+
                    "\n"+_getDep().toString(),
                    style: const TextStyle(color: Colors.white)
                ),

            ),/*ButtonTheme(
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('Voir +', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "This is Toast message",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1
                      );},
                  ),
                ],
              ),
            ),*/
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
      date : json['date'],
      type : json['type'],
      nom : json['nom'],
      prenom : json['prenom'],
      numDep : json['numDep'],
    );
  }
  _getLibelle() => libelle;

  _getDescription() => description;

  _getDate() => date;

  _getPrenom() => prenom;

  _getNom() => nom;

  _getDep() => numDep;

  _getIdService() => idService;

  _getColor(){
    if ( type == 0 ) {
      return Colors.darkblue;
    } else {
      return Colors.redDark;
    }
  }

  _getType(){
    if ( type == 0 ) {
      return 'Demande';
    } else {
      return 'Proposition';
    }
  }
}