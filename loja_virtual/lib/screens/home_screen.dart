import 'package:flutter/material.dart';
import 'package:loja_virtual/tab/home_tab.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeTab(),
        Container(color: Colors.yellow),
        Container(color: Colors.red)
      ],
    );
  }
}

