import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
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
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
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
                    Positioned(
                      top: size.height * 0.05,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: Palette.darkBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: const Icon(
                          Icons.arrow_upward,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
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
                      hint: 'Prénom *',
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
                    const RoundedButton(buttonName: 'S\'enregistrer'),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Déjà un compte ?',
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
}
