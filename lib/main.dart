import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Todo', home: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TodoList'),
        ),
        body: TodoList());
  }
}

class Item {
  const Item({this.value});
  final String value;
}

class ShowItem extends StatelessWidget {
  ShowItem({this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.value),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Item> _items = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView(
        children: _items.map((Item item) {
          return ShowItem(item: item);
        }).toList(),
      )),
      TextField(
        controller: _controller,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
            labelText: 'new item'),
        onSubmitted: (newItem) {

          setState(() {
            _items.add(Item(value: newItem));
            _controller.clear();
          });
        },
      )
    ]);
  }
}
