import 'package:flutter/material.dart';

class AddPlayer extends StatefulWidget {
  final Function addPlayer;

  AddPlayer(this.addPlayer);

  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final _playerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _playerController,
              cursorColor: Theme.of(context).accentColor,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Spieler',
                  labelStyle: TextStyle(color: Colors.white)),
              onSubmitted: (input) {
                widget.addPlayer(input);
                _playerController.clear();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
              heroTag: 'addButton',
              elevation: 0,
              onPressed: () {
                widget.addPlayer(_playerController.text);
                _playerController.clear();
              },
              child: Icon(Icons.add, color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
