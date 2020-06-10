import 'package:flutter/material.dart';

class ChipItem extends StatelessWidget {
  final String name;
  final Function onDelete;

  ChipItem({@required this.name, @required this.onDelete});
  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 5),
      onDeleted: () => onDelete(name),
      backgroundColor: Theme.of(context).primaryColorDark,
      deleteIcon: Icon(
        Icons.close,
        color: Theme.of(context).accentColor,
      ),
      label: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
