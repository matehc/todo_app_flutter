import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import './widgets/dialog_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final List todoList = [
    ['Eat food', true],
    ['Get stressed', false],
    ['Make money', true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveTodo() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  createNewTask() {
    return showDialog(
      context: context,
      builder: ((context) => DialogBox(
            controller: _controller,
            onSave: saveTodo,
            onCancel: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ToDo',
            style: TextStyle(fontSize: 26),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: ((context, index) {
            return TodoTile(
                isCompleted: todoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTask: (context) => deleteTask(index),
                taskName: todoList[index][0]);
          }),
        ));
  }
}
