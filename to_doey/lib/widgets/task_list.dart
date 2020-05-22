import 'package:flutter/material.dart';
import 'package:to_doey/models/tarefa.dart';
import 'package:to_doey/widgets/task_row.dart';

class TaskList extends StatefulWidget {
  final List<Tarefa> list;
  TaskList({this.list});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskRow(
          isChangedCallBack: (checkState) {
            setState(() {
              widget.list[index].concluirTarefa();
            });
          },
          taskTitle: widget.list[index].titulo,
          isChecked: widget.list[index].isDone,
        );
      },
      itemCount: widget.list.length,
    );
  }
}
