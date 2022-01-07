import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtmAppBar extends StatelessWidget {
  const BtmAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.redDark,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {},),
          IconButton(icon: const Icon(Icons.search), onPressed: () {
            Navigator.pushNamed(context, 'ResearchScreen');
          },),
          IconButton(icon: const Icon(Icons.map), onPressed: () {
            Navigator.pushNamed(context, 'MapScreen');
          },),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined), onPressed: () {
            Navigator.pushNamed(context, 'LoginScreen');
          },),
        ],
      ),
    )
    ;
  }
}