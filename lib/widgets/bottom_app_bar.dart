import 'package:flutter/material.dart';

import '../pallete.dart';

// ignore: unused_element, non_constant_identifier_names
_BottomAppBarWidget() {
  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, 'ResearchScreen');
              },
            ),
            IconButton(
              icon: const Icon(Icons.map),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                Navigator.pushNamed(context, 'LoginScreen');
              },
            ),
          ],
        ),
        shape: const CircularNotchedRectangle(),
        color: Palette.redDark);
  }
}
