import 'dart:convert';
import 'dart:core';

import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:app_le_bon_francais/class/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _launchURL(int id) async {
    String url = 'http://192.168.210.1/tv?id=' + id.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
    Size size = MediaQuery.of(context).size;
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
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.075),
                  child: _titre(context),
                ),
                _createSearchView(context),
                _serviceListView(context),
              ],
            )));
  }

  Widget _titre(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return const Text(
      'Le Bon Français',
      style: TextStyle(
          color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
    );
  }

  Widget _createSearchView(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.05),
      height: size.height * 0.075,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        color: Palette.darkBlue[400],
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
                                  //Card of a service
                                  ListTile(
                                    title: Text(
                                      data[index].libelle,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      data[index].description +
                                          '\n' +
                                          data[index].numDep +
                                          '-' +
                                          data[index].nomDep,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  //Button
                                  ButtonTheme(
                                    child: ButtonBar(
                                      children: <Widget>[
                                        TextButton(
                                          child: const Text('Voir +',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          onPressed: () {
                                            //Pop up of this service for more infos
                                            Alert(
                                              context: context,
                                              title: data[index].libelle,
                                              desc: data[index].description,
                                              buttons: [
                                                DialogButton(
                                                    child: const Text(
                                                      "Reserver",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () {
                                                      //Button to open the website to reserve it
                                                      widget._launchURL(
                                                          data[index]
                                                              .idService);
                                                    },
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
                                                      //Button to back on the list
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
                      Navigator.popAndPushNamed(context, '/');
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
