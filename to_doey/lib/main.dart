import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_doey/screens/tasks_screen.dart';
import 'models/data_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
        child: MaterialApp(
          home: TasksScreen(),
        ),
      ),
    );
