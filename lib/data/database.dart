import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  //list of todo task
  List toDoList = [];

  //
  TodoDataBase() {
    createInitialData();
  }
  //refrence our box
  final _mybox = Hive.box("mybox");

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["task", false],
      ["Exercise", false],
    ];
  }

  //load data from the database
  void loadData() {
    toDoList = _mybox.get("TODOLIST") ?? [];
  }

  //update the data in the database
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
