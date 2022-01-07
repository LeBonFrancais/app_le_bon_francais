import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Bon Francais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.darkblue,
          backgroundColor: Colors.blueGrey
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'MapScreen': (context) => MapScreen(),
        'ResearchScreen': (context) => const ResearchScreen(),
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
