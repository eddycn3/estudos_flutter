import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:to_doey/models/tarefa.dart';

class DataProvider with ChangeNotifier {
  List<Tarefa> _listOfTasks = [];
  UnmodifiableListView<Tarefa> get listOfTasks =>
      UnmodifiableListView<Tarefa>(_listOfTasks);

  int get listCount => listOfTasks.length;

  void addTarefa(String tarefaDesc) {
    if (tarefaDesc == null) return;

    _listOfTasks.add(Tarefa(titulo: tarefaDesc));
    notifyListeners();
  }

  void checkTask(Tarefa tarefa) {
    print(jsonEncode(tarefa));
    tarefa.updateTask();
    notifyListeners();
  }

  void deleteTask(index) {
    _listOfTasks.removeAt(index);
    notifyListeners();
  }
}
