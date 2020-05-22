import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onTaskAdded;

  const AddTaskScreen({this.onTaskAdded});
  @override
  Widget build(BuildContext context) {
    String _taskText;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Adicionar Tarefa",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6CC0FC),
              ),
            ),
            TextField(
              onChanged: (e) {
                _taskText = e;
              },
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              color: Color(0xFF6CC0FC),
              child: Text("Adicionar",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                onTaskAdded(_taskText);
              },
            ),
          ],
        ),
      ),
    );
  }
}
