import 'dart:convert';

import 'package:captain_blue/models/task.dart';
import 'package:captain_blue/screens/start-page.dart';
import 'package:captain_blue/widgets/task-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/gameScreen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String task = 'Aufgabe';
  Task taskGenerator;

  @override
  void initState() {
    setTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(StartPage.routeName);
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onTap: () => newTask(),
              child: TaskText(task),
            ),
          ),
        ],
      ),
    );
  }

  void newTask() {
    setState(() {
      task = taskGenerator.generateTask();
    });
  }

  Future<void> setTasks() async {
    var json = await _parseJson();
    taskGenerator = Task.fromJson(json);
  }

  Future<dynamic> _parseJson() async {
    String jsonString = await rootBundle.loadString("assets/group_tasks.json");
    return jsonDecode(jsonString);
  }
}
