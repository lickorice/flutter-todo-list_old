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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Code here
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
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
        TodoListItem("Item 1"),
        TodoListItem("Item 2"),
        TodoListItem("Item 3"),
      ],
    );
  }
}

class TodoListItem extends StatefulWidget {
  final String itemTitle;
  TodoListItem(this.itemTitle);

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: checked,
          onChanged: (bool value) {setState(() {
            checked = value;
          });},  
        ),
        Text(widget.itemTitle),
      ],
    );
  }
}