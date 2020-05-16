import './widgets/add_player.dart';

import 'package:flutter/material.dart';

void main() => runApp(CaptainBlue());

class CaptainBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Captain Blue',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.lime,
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AddPlayer(),
      ),
    );
  }
}
