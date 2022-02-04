import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          title: const Text("Contacter support"),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(32),
                  child: ElevatedButton(
                      child: const Text('Make mail'),
                      onPressed: () => launchEmail(
                            toEmail: 'lebonfrancais.service@gmail.com',
                            subject: '',
                            message: '',
                          ))),
            ])
      ],
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
