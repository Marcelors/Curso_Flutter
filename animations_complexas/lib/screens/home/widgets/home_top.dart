import 'package:flutter/material.dart';

import 'category_view.dart';

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;

  HomeTop({@required this.containerGrow});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Bem-Vindo, Xuxu",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          Container(
            alignment: Alignment.topRight,
            width: containerGrow.value * 120,
            height: containerGrow.value * 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("images/perfil.jpg"), fit: BoxFit.cover)),
            child: Container(
              width: containerGrow.value * 35,
              height: containerGrow.value * 35,
              margin: EdgeInsets.only(left: 80),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      fontSize: containerGrow.value * 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1.0)),
            ),
          ),
          CategoryView()
        ],
      )),
    );
  }
}
