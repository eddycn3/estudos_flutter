import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: App()));
}
