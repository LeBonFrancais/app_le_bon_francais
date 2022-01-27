import 'dart:convert';
import 'dart:core';

import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:app_le_bon_francais/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        child: FutureBuilder<List<CardWidget>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CardWidget>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: Center(
                        child: Text(data![index].libelle),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator(color: Colors.amber);
          },
        ),
      ),
    );
  }
}
