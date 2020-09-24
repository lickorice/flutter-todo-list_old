import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter To-Do List'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}