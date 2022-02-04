import 'dart:convert';
import 'dart:core';

import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:app_le_bon_francais/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

Future<List<CardWidget>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://192.168.212.8/api/service'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => CardWidget.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<CardWidget>>? futureData;
  Color typeS = Palette.redDark;
  final _searchview = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BtmAppBar(),
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
            child: Column(
              //_createSearchView(context) : Barre de recherche
              //_serviceListView() : Liste des services - Cercle rafraishissement si pas de données
              children: [
                _titre(context),
                _createSearchView(context),
                _serviceListView(context),
              ],
            )));
  }

  Widget _titre(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return const Flexible(
      child: Center(
        child: Text(
          'Le Bon Français',
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _createSearchView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.05),
      height: size.height * 0.06,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        color: Palette.darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        cursorColor: Colors.white,
        controller: _searchview,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _serviceListView(BuildContext context) {
    return FutureBuilder<List<CardWidget>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CardWidget>? data = snapshot.data;
            return Expanded(
                child: ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (data![index].type == 1) {
                        typeS = Palette.darkBlue;
                      }
                      return Container(
                          margin: const EdgeInsets.all(0.0),
                          padding: const EdgeInsets.all(5.0),
                          color: Colors.transparent,
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              color: typeS,
                              elevation: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(
                                        Icons.accessible_forward_sharp,
                                        size: 50),
                                    title: Text(data[index].libelle,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    subtitle: Text(data[index].description,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                  ButtonTheme(
                                    child: ButtonBar(
                                      children: <Widget>[
                                        TextButton(
                                          child: const Text('Voir +',
                                              style: TextStyle(
                                                  color: Colors.white)),
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
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () {},
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Palette.redDark,
                                                          Palette.darkBlue
                                                        ])),
                                                DialogButton(
                                                  child: const Text(
                                                    "Fermer",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  color: const Color.fromRGBO(
                                                      0, 179, 20, 1.0),
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
                          ));
                    }));
          } else if (snapshot.hasError) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  const Text(
                    'Refresh',
                    style: kBodyText,
                  )
                ]);
          }
          // By default show a loading spinner.
          return const CircularProgressIndicator(color: Colors.amber);
        });
  }
}
