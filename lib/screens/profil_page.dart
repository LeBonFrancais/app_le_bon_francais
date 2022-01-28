import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            bottomNavigationBar: const BtmAppBar(),
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
              child: Column(
                children: [
                  const Flexible(
                    child: Center(
                      child: Text(
                        'Mes\ninformations',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      TextInputField(
                        icon: Icons.account_circle_outlined,
                        hint: 'Nom',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        icon: Icons.account_circle_outlined,
                        hint: 'Prénom',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        icon: Icons.mail,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        icon: Icons.phone,
                        hint: 'Téléphone',
                        inputType: TextInputType.phone,
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
                ],
              ),
            )),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
}
