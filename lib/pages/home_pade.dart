import 'package:flutter/material.dart';
import 'package:flutter_do/utils/dialog_box.dart';
import 'package:flutter_do/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // list of todo tasks
  // ignore: non_constant_identifier_names
  List ToDoList = [];

  // function to change the checkbox state
  void checkBoxChange(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState((){
      ToDoList.add([ _controller.text, false]);
      _controller.clear();
    });
      Navigator.of(context).pop();
  }
  // delete task
  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
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
        itemCount: ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: ToDoList[index][0],
            taskCompleted: ToDoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index)
          );
        } ,
        
      ),

    );
  }
}


// 0xFF1A1A1A