import 'package:app_le_bon_francais/widgets/btmappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BtmAppBar(),
      body: Align(
        alignment: Alignment.center,
        child:
          IconButton(icon: const Icon(Icons.home), onPressed: () {Navigator.pushNamed(context, 'ProfilePage');},)
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