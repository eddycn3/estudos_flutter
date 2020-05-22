import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function isChangedCallBack;

  TaskRow({this.taskTitle, this.isChecked, this.isChangedCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w700),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: isChangedCallBack,
      ),
    );
  }
}
