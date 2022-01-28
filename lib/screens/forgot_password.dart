import 'package:flutter/material.dart';
import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/rounded_button.dart';
import 'package:app_le_bon_francais/widgets/text_field_input.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: Container(
              decoration : const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,

                  colors: [
                    Palette.darkBlue,
                    Palette.redDark,
                  ],
                ),
              ),
              child:
                Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context,'LoginScreen');
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: kWhite,
                        ),
                      ),
                      title: const Text(
                        'Mot de passe oublié',
                        style: kBodyText,
                      ),
                      centerTitle: true,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      child: const Text(
                        'Entrez votre e-mail, nous vous enverrons des instructions pour réinitialiser votre mot de passe',
                        style: kBodyText,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextInputField(
                      icon: Icons.mail,
                      hint: 'E-mail',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done, key: null,

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const RoundedButton(buttonName: 'Envoyer', key: null,)
                  ],
                ),
            ),
        ),
      ],
    );
  }
}