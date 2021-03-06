import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            //margin: ,
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
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context, 'LoginScreen');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kWhite,
                    ),
                  ),
                  title: const Text(
                    'Nouveau compte',
                    style: kBodyText,
                  ),
                  centerTitle: true,
                ),
                Center(
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: CircleAvatar(
                        radius: size.width * 0.10,
                        backgroundColor: Palette.redDark,
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: kWhite,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const TextInputField(
                      icon: Icons.account_circle_outlined,
                      hint: 'Nom *',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    const TextInputField(
                      icon: Icons.account_circle_outlined,
                      hint: 'Pr??nom *',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    const TextInputField(
                      icon: Icons.mail,
                      hint: 'E-mail *',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    const PasswordInput(
                      icon: Icons.lock,
                      hint: 'Mot de passe *',
                      inputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    _button(context),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'D??j?? un compte ?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, 'LoginScreen');
                          },
                          child: Text(
                            ' Se connecter',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
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
              msg: 'Ce composant est en cours de d??veloppement !');
        },
        child: Text(
          'S\'enregistrer',
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
