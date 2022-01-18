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
            CardWidget(idService: 1,libelle: 'Ménage',description: 'Je sais pas faire mon ménage',date: '14/01/2022',type: 0,nom: 'Achour',prenom: 'Mouloud',numDep: 22,),
            CardWidget(idService: 1,libelle: 'Course',description: 'Disponible pour amener des personnes faire leur courses',date: '14/01/2022',type: 1,nom: 'Crespo-mara',prenom: 'Audrey',numDep: 29,),
            CardWidget(idService: 1,libelle: 'Covoiturage',description: 'Je dois aller de rennes a redon.',date: '14/01/2022',type: 0,nom: 'Boulot',prenom: 'Gilles',numDep: 35,),
            CardWidget(idService: 1,libelle: 'Découverte patrimoine',description: 'Je suis disponible pour vous faire découvrir le patrimoine de la loire atlantique',date: '14/01/2022',type: 1,nom: 'Bern',prenom: 'Stephane',numDep: 44,),
            CardWidget(idService: 1,libelle: 'Bingo',description: 'Recherche d\'une soirée bingo ',date: '14/01/2022',type: 0,nom: 'Foucault',prenom: 'Jean-pierre',numDep: 49,),
            CardWidget(idService: 1,libelle: 'Speedrun Binding of isaac',description: 'Demandez-moi si vous vous voulez des conseils sur des methode pour speedrun le jeu',date: '14/01/2022',type: 1,nom: 'Roselmack',prenom: 'Harry',numDep: 50,),
            CardWidget(idService: 1,libelle: 'Speedrun',description: 'description',date: '14/01/2022',type: 0,nom: 'Sublet',prenom: 'Alessandra',numDep: 56,),
            CardWidget(idService: 1,libelle: 'Appartement ou maison à louer',description: 'Je met à disposition mes biens pour que vous puissez passez un séjour dans ce qu\'est le merveilleux département de le Rhone ',date: '14/01/2022',type: 1,nom: 'Plaza',prenom: 'Stephane',numDep: 69,),
            CardWidget(idService: 1,libelle: 'Victime d\'arnaque ',description: 'Je viens d\'être victime d\'une arnaque que suis-je censé faire',date: '14/01/2022',type: 0,nom: 'Courbet',prenom: 'Julien',numDep: 75,),
            CardWidget(idService: 1,libelle: 'Rénovation maison',description: 'J\'ai besoin de bras pour rénover une maison d\'une famille avec 3 enfants dans l\'Esonne',date: '14/01/2022',type: 1,nom: 'Damidot',prenom: 'Valérie',numDep: 91,),
          ],

        ),
      ),
    );
  }


}