import 'package:app_le_bon_francais/pallete.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Le Bon Francais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Palette.darkBlue, backgroundColor: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'MapScreen': (context) => const MapScreen(),
        'ResearchScreen': (context) => const ResearchScreen(),
        'MailScreen' : (context) => const ResearchScreen(),
        //Condition si connecté
        'ProfilePage': (context) => const ProfilePage(),
        //Condition si non connecté
        'LoginScreen': (context) => const LoginScreen(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'CreateNewAccount': (context) => const CreateNewAccount(),
      },
    );
  }
}
