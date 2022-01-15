import 'dart:convert';

import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:app_le_bon_francais/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future <List<CardWidget>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => CardWidget.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BtmAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Palette.darkBlue,
                Palette.redDark,
              ],
            ),
          ),
        alignment: Alignment.center,
        child: ListView(
                children: const [
                  // Exemple de card widget
                  // CardWidget(idService: ,libelle: '',description: '',date: '',type: ,nom: '',prenom: '',numDep: ,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 0,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 0,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 0,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 0,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                  CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 1,nom: 'Ma',prenom: 'Th',numDep: 34,),
                ],
              ),
      ),
    );
  }


}