import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDo = '';
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Купить молока', 'Помыть посуду', 'Почистить картошку']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text('Список дел', style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 30,
        ),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xFFF57B24),
                      ),
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              onDismissed: (direction) {
                  setState(() {
                    todoList.removeAt(index);
                  });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF57B24),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoList.add(_userToDo);
                      });
                      Navigator.of(context).pop();
                },
                    child:
                      Text('Добавить')
                ),
              ],
            );
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
