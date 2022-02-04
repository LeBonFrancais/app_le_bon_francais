import 'package:app_le_bon_francais/pallete.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BtmAppBar extends StatelessWidget {
  const BtmAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Palette.redDark,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.pushNamed(context, 'MapScreen');
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'NewService');
            },
          ),
          IconButton(
              icon: const Icon(Icons.mail),
              onPressed: () {
                launchEmail(
                  toEmail: 'lebonfrancais.service@gmail.com',
                  subject: '',
                  message: '',
                );
              }),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'LoginScreen');
            },
          ),
        ],
      ),
    );
  }

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url = 'mailto:$toEmail';

    if (await canLaunch(url)) {
      await launch(
        url,
      );
    }
  }
}
