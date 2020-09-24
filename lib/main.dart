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
          child: TodoList(),
        ),
      ),
    );
  }
}

class TodoList extends ListView {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TodoListItem("Asd"),
      ],
    );
  }
}

class TodoListItem extends StatefulWidget {
  final String itemTitle;
  bool checked = false;
  TodoListItem(this.itemTitle);

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  String _title;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: widget.checked,
          onChanged: (bool value) {setState(() {
            widget.checked = value;
          });},  
        ),
        Text(widget.itemTitle),
      ],
    );
  }
}