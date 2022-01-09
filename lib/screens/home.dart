import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:app_le_bon_francais/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


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
                Colors.darkblue,
                Colors.redDark,
              ],
            ),
          ),
        alignment: Alignment.center,
        child: ListView(
                children: const [

                  // Model
                  // CardWidget( libelle:<string>, description: <string>, date: <string>, type: <int>, ),

                  // Valeur de test
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 1,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 1,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 1,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 1,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 1,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                  CardWidget(libelle:'Elément 1',description: 'catégorie 1',date: '12-12-2012',type: 0,),
                ],
              ),
      ),

    );
  }
}