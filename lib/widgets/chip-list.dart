import 'package:flutter/material.dart';

import './chip-item.dart';

class ChipList extends StatefulWidget {
  final List<String> items;
  final Function onDelete;

  ChipList({this.items, this.onDelete});

  @override
  _ChipListState createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.items
            .map((name) => Padding(
                  padding: EdgeInsets.all(4),
                  child: ChipItem(
                    name: name,
                    onDelete: widget.onDelete,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
