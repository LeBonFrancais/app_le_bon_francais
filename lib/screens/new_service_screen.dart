import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NewService extends StatefulWidget {
  const NewService({Key? key}) : super(key: key);

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
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
            child: const Text(
              'Ajouter un service',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            )));
  }
}
