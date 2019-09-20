import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromARGB(255, 203, 236, 241),
        Colors.white,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
