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
  List <TodoListItem> _todoList;

  @override
  void initState() {
    super.initState();
    _todoList = [
      TodoListItem("Item 1", this._removeTodoListItem),
      TodoListItem("Item 2", this._removeTodoListItem),
      TodoListItem("Item 3", this._removeTodoListItem),
      TodoListItem("Item 4", this._removeTodoListItem),
      TodoListItem("Item 5", this._removeTodoListItem),
    ];
  }

  void _addTodoListItem() {
    setState(() {
      _todoList.add(TodoListItem("Item " + (_todoList.length+1).toString(), this._removeTodoListItem));
    });
  }

  void _removeTodoListItem(item) {
    setState(() {
      _todoList.remove(item);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        return _todoList[index];
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
  final Function(TodoListItem) removeItem;
  TodoListItem(this.itemTitle, this.removeItem);

  @override
  _TodoListItemState createState() => _TodoListItemState(removeItem);
}

class _TodoListItemState extends State<TodoListItem> {
  Function(TodoListItem) removeItem;
  _TodoListItemState(this.removeItem);

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
                removeItem(widget);
              });
            },
            child: Text("DELETE", style: TextStyle(color: Colors.red),),
          ),
        ],),
      ],
    );
  }
}