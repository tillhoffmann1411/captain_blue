import 'package:flutter/material.dart';

import './game-screen.dart';
import '../widgets/add_player.dart';
import '../widgets/chip-list.dart';

class StartPage extends StatefulWidget {
  static const routeName = '/startPage';
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<String> _players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ChipList(
                items: _players,
                onDelete: _removePlayer,
              ),
              AddPlayer(_addPlayer),
              FloatingActionButton(
                heroTag: 'playButton',
                elevation: 0,
                onPressed: () {
                  if (_players.length > 1) {
                    Navigator.of(context)
                        .pushReplacementNamed(GameScreen.routeName);
                  }
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPlayer(String name) {
    if (name.isEmpty || _players.contains(name) || _players.length >= 10)
      return;

    setState(() {
      _players.add(name);
    });
  }

  void _removePlayer(player) {
    setState(() {
      _players.remove(player);
    });
  }
}
