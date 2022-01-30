import 'package:flutter/material.dart';
import 'package:app_le_bon_francais/pallete.dart';
import 'package:app_le_bon_francais/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
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

            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Flexible(
                    child: Center(
                      child: Text(
                        'Se connecter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TextInputField(
                        icon: Icons.mail,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const PasswordInput(
                        icon: Icons.password,
                        hint: 'Mot de passe',
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.done,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                        child: const Text(
                          'Mot de passe oublié',
                          style: kBodyText,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const RoundedButton(
                        buttonName: 'Login',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                    child: Container(
                      child: const Text(
                        'Créer nouveau compte',
                        style: kBodyText,
                      ),
                      decoration: const BoxDecoration(
                          border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Spacer(flex: 1)
                ],

              ),
          ),
        )
      ],
    );
  }
}