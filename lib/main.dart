import 'package:captain_blue/screens/game-screen.dart';
import 'package:captain_blue/screens/start-page.dart';

import 'package:flutter/material.dart';

void main() => runApp(CaptainBlue());

class CaptainBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Captain Blue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(4, 51, 191, 1),
        primaryColorDark: Color.fromRGBO(2, 24, 89, 1),
        primaryColorLight: Color.fromRGBO(11, 185, 217, 1),
        accentColor: Color.fromRGBO(242, 92, 162, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        StartPage.routeName: (context) => StartPage(),
        GameScreen.routeName: (context) => GameScreen(),
      },
    );
  }
}
