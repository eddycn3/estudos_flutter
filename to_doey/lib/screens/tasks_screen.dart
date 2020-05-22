import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doey/main.dart';
import 'package:to_doey/models/data_provider.dart';
import 'package:to_doey/widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6CC0FC),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
            );
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Color(0xFF6CC0FC),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Todoey",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800),
                ),
                Text("${context.watch<DataProvider>().listCount} Tarefas",
                    style: TextStyle(color: Colors.white, fontSize: 20.0))
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: TaskList()),
          ),
        ],
      ),
    );
  }
}
