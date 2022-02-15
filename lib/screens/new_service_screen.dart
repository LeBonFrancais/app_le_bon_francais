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
              children: const [
                TextInputField(
                  icon: Icons.title,
                  hint: 'Titre',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                TextInputField(
                  icon: Icons.text_snippet_outlined,
                  hint: 'Description',
                  inputType: TextInputType.multiline,
                  inputAction: TextInputAction.next,
                ),
                TextInputField(
                  icon: Icons.architecture_sharp,
                  hint: 'Departement',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                TextInputField(
                  icon: Icons.work_outlined,
                  hint: 'Demande ou Proposition',
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
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
}