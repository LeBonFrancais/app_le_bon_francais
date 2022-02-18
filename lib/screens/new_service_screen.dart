import 'dart:html';

import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewService extends StatefulWidget {
  const NewService({Key? key}) : super(key: key);

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            const Flexible(
              child: Center(
                child: Text(
                  ' Demande\nProposition',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const TextInputField(
                  icon: Icons.title,
                  hint: 'Titre',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                const TextInputField(
                  icon: Icons.text_snippet_outlined,
                  hint: 'Description',
                  inputType: TextInputType.multiline,
                  inputAction: TextInputAction.next,
                ),
                const TextInputField(
                  icon: Icons.blur_circular_outlined,
                  hint: 'Departement',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: size.height * 0.15,
                  width: size.width * 0.8,
                  child: Column(
                    //Radio button pour choisir entre recherche ou proposition
                    children: <Radio>[
                      /*
                      RadioButtonInputElement(),
                      RadioButtonInputElement(),
                      */
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                _button(context),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Palette.darkBlue,
      ),
      child: TextButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: 'Ce composant est en cours de développement !');
        },
        child: Text(
          'Ajouter',
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
