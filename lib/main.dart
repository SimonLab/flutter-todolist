import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Todo', home: TodoList()));
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todolist')), body: Text('list of items'));
  }
}
