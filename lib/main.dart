import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TodoList();
  }
}

class TodoList extends StatefulWidget {
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List <TodoListItem> _todoList = [
    TodoListItem("Item 1"),
    TodoListItem("Item 2"),
    TodoListItem("Item 3"),
    TodoListItem("Item 4"),
    TodoListItem("Item 5"),
  ];

  void _addTodoListItem() {
    setState(() {
      _todoList.add(TodoListItem("Item " + (_todoList.length+1).toString()));
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoList.length) return _todoList[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To-Do List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter To-Do List'),
        ),
        body: Center(
          child: _buildTodoList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTodoListItem();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
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
  bool _checked = false;
  bool _isDeleted = false;

  @override
  Widget build(BuildContext context) {
    if (_isDeleted) return Container();
    else return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(children: <Widget>[
          Checkbox(
            value: _checked,
            onChanged: (bool value) {setState(() {
              _checked = value;
            });},  
          ),
          Text(widget.itemTitle),
        ],),
        Row(children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                _isDeleted = true;
              });
            },
            child: Text("DELETE", style: TextStyle(color: Colors.red),),
          ),
        ],),
      ],
    );
  }
}