import 'package:flutter/material.dart';
import 'package:flutter_do/data/database.dart';
import 'package:flutter_do/utils/dialog_box.dart';
import 'package:flutter_do/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // reference the hive box
  final _flutterBox = Hive.box('FlutterBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // 1st time erver opening the app
    if (_flutterBox.get("TODOLIST") == null) {
      db.createInicialData();
    } else {
      // there already exists data
      db.loadData();
    } 
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // function to change the checkbox state
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState((){
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
      Navigator.of(context).pop();
      db.updateData();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  // edit task
  void editTask(int index) {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              db.toDoList[index][0] = _controller.text;
            });
            Navigator.of(context).pop();
            _controller.clear();
            db.updateData();
          },
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
        );
      },
    );
  }

  // function to create a new task
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();  
            _controller.clear();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(216, 0, 0, 0),
        elevation: 0,
        title: const Text('F L U T T E R  D O !', 
          style: TextStyle(
            color: Color.fromARGB(255, 214, 214, 214),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(216, 0, 0, 0),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
            editFunction: (context) => editTask(index),
          );
        } ,
        
      ),

    );
  }
}


// 0xFF1A1A1A