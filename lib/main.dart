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
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Le Bon Francais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Palette.darkBlue, backgroundColor: Colors.blueGrey),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
        '/': (context) => const HomeScreen(),
        'MapScreen': (context) => const MapScreen(),

        //Si connecté afficher la page
        'NewService': (context) => const NewService(),
        //Sinon rediriger vers page de connexion
        //redirect -> LoginScreen

        'MailScreen': (context) => const MailScreen(),
        'WebViewApp': (context) => const WebViewApp(),

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
