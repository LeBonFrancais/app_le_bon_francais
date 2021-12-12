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
        'MapScreen': (context) => const MapScreen(),
        'ResearchScreen': (context) => const ResearchScreen(),
        'ProfilePage': (context) => const ProfilePage(),
        'LoginScreen': (context) => const LoginScreen(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'CreateNewAccount': (context) => const CreateNewAccount(),
      },


    );
  }
}
