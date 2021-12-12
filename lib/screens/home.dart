import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               IconButton(icon: const Icon(Icons.home), color: Colors.white, onPressed: () {  },),
              IconButton(icon: const Icon(Icons.search), onPressed: () {Navigator.pushNamed(context, 'ResearchScreen');},),
              IconButton(icon: const Icon(Icons.map), onPressed: () {Navigator.pushNamed(context, 'MapScreen');},),
              IconButton(icon: const Icon(Icons.account_circle_outlined), onPressed: () {Navigator.pushNamed(context, 'LoginScreen');},),
            ],
          ),
          shape: const CircularNotchedRectangle(),
          color: Colors.redDark
      ),
      body: Align(
        alignment: Alignment.center,
        child: IconButton(icon: const Icon(Icons.home), onPressed: () {Navigator.pushNamed(context, 'ProfilePage');},),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}