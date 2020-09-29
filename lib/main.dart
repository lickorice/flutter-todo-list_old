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
      TodoListItem("Item 1", this._removeTodoListItem, Key("1")),
      TodoListItem("Item 2", this._removeTodoListItem, Key("2")),
      TodoListItem("Item 3", this._removeTodoListItem, Key("3")),
      TodoListItem("Item 4", this._removeTodoListItem, Key("4")),
      TodoListItem("Item 5", this._removeTodoListItem, Key("5")),
    ];
  }

  void _addTodoListItem() {
    setState(() {
      _todoList.add(TodoListItem("Item " + (_todoList.length+1).toString(), this._removeTodoListItem, Key((_todoList.length+1).toString())));
    });
  }

  void _removeTodoListItem(item) {
    debugPrint(item.itemTitle);
    setState(() {
      _todoList.remove(item);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      // key: Key(_todoList.length.toString()),
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
  TodoListItem(this.itemTitle, this.removeItem, Key key) : super(key: key);

  @override
  _TodoListItemState createState() => _TodoListItemState(itemTitle, removeItem);
}

class _TodoListItemState extends State<TodoListItem> {
  Function(TodoListItem) removeItem;
  String itemTitle;

  _TodoListItemState(this.itemTitle, this.removeItem);

  TextEditingController itemTitleController = new TextEditingController();
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
          Text(itemTitle),
        ],),
        Row(children: <Widget>[
          FlatButton(
            onPressed: () {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Text("Change Item Title"),
                  content: TextField(
                    decoration: new InputDecoration(hintText: "Item title"),
                    controller: itemTitleController,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("SAVE"),
                      onPressed: () {
                        setState(() {
                          itemTitle = itemTitleController.text;
                        });
                        Navigator.of(context).pop();
                      }
                    )
                  ],
                ),
              );
            },
            child: Text("EDIT", style: TextStyle(color: Colors.blue),),
          ),
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