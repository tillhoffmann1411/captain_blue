import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final _playerController = TextEditingController();

  final List<String> _player = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _player
                    .map((e) => Padding(
                          padding: EdgeInsets.all(4),
                          child: Chip(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            onDeleted: () => _removePlayer(e),
                            backgroundColor: Theme.of(context).primaryColorDark,
                            deleteIcon: Icon(
                              Icons.close,
                              color: Theme.of(context).accentColor,
                            ),
                            label: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _playerController,
                      cursorColor: Theme.of(context).accentColor,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.lime,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.lime,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Spieler',
                      ),
                      onSubmitted: (_) => _addPlayer,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FloatingActionButton(
                      onPressed: _addPlayer,
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FloatingActionButton(
                      onPressed: _addPlayer,
                      child: Icon(
                        Icons.play_arrow,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addPlayer() {
    if (_playerController.text.isEmpty ||
        _player.contains(_playerController.text) ||
        _player.length >= 10) return;

    setState(() {
      _player.add(_playerController.text);
      _playerController.clear();
    });
  }

  void _removePlayer(player) {
    setState(() {
      _player.remove(player);
    });
  }
}
