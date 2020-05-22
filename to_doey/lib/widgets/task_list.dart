import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doey/models/data_provider.dart';
import 'package:to_doey/widgets/task_row.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) => ListView.builder(
        itemBuilder: (context, index) {
          final task = dataProvider.listOfTasks[index];
          return GestureDetector(
            onLongPress: () {
              dataProvider.deleteTask(index);
            },
            child: TaskRow(
              taskTitle: task.titulo,
              isChecked: task.isDone,
              isChangedCallBack: (e) {
                dataProvider.checkTask(task);
              },
            ),
          );
        },
        itemCount: dataProvider.listOfTasks.length,
      ),
    );
  }
}
