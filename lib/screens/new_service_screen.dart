import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
        child: Text(
          "35 - Ille-et-vilaine",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "35"),
    DropdownMenuItem(
        child: Text(
          "36 - Indre-et-Loire",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "36"),
    DropdownMenuItem(
        child: Text(
          "44 - Loire-Atlantique",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "44"),
    DropdownMenuItem(
        child: Text(
          "49 - Maine-et-loire",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "49"),
    DropdownMenuItem(
        child: Text(
          "53 - Mayenne",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "53"),
    DropdownMenuItem(
        child: Text(
          "72 - Sarthe",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "72"),
    DropdownMenuItem(
        child: Text(
          "85 - Vendée",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "85"),
    DropdownMenuItem(
        child: Text(
          "86 - Vienne",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: "86"),
  ];
  return menuItems;
}

/*
Partie pour ajouter un service en base

BDD : IDSERVICE, LIBELLE, DESCRIPTION, RECHERCHE (1 : recherche - 0: proposition), PUBLIQUE, IDINSCRIT

Appeler l'API pour ajouter le service en BDD

Vérifier que tous soit bien rempli
Avec le choix du tye de service validé

*/

class NewService extends StatefulWidget {
  const NewService({Key? key}) : super(key: key);

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Object? val = -1;
    String selectedValue = "49";

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
                  ' Ajouter un service',
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
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.8,
                  child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        iconColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                      ),
                      dropdownColor: Colors.grey,
                      focusColor: Colors.white,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  child: Column(
                    //Radio button pour choisir entre recherche ou proposition
                    children: [
                      ListTile(
                        title: const Text(
                          "Recherche",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Radio(
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          },
                          activeColor: Palette.darkBlue,
                        ),
                      ),
                      ListTile(
                        title: const Text("Proposition",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        leading: Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          },
                          activeColor: Palette.darkBlue,
                        ),
                      ),
                    ],
                  ),
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
