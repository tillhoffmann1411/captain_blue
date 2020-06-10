import 'dart:math';

class Task {
  String base;
  List<String> fillers;

  Task(this.base, this.fillers);

  Task.fromJson(Map<String, dynamic> json) {
    this.base = json['base'];
    this.fillers = List.from(json['fillers']);
  }

  String generateTask() {
    var filler = fillers.elementAt(Random().nextInt(fillers.length));
    var taskWithFiller = base.replaceFirst('\$task', filler);
    var task = taskWithFiller.replaceFirst(
        '\$sip', 'trinken ${(Random().nextInt(4) + 1).toString()} Schlücke');
    return task;
  }

  @override
  String toString() {
    return 'base: $base; fillers: ${fillers.toString()}';
  }
}
