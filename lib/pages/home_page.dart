import 'package:flutter/material.dart';
import 'package:flutter_do/data/database.dart';
import 'package:flutter_do/utils/dialog_box.dart';
import 'package:flutter_do/utils/modal_dialog_box.dart';
import 'package:flutter_do/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime date = DateTime.now();
  static const Map<int, String> weekdayName = {
    1: "Monday", 
    2: "Tuesday", 
    3: "Wednesday", 
    4: "Thursday", 
    5: "Friday", 
    6: "Saturday", 
    7: "Sunday"
  };
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
  final _controller_name = TextEditingController();
  final _controller_description = TextEditingController();

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
      db.toDoList.insert(0, [ _controller_name.text, _controller_description.text, false]);
      _controller_name.clear();
      _controller_description.clear();
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
          controller: _controller_name,
          onSave: () {
            setState(() {
              db.toDoList[index][0] = _controller_name.text;
            });
            Navigator.of(context).pop();
            _controller_name.clear();
            db.updateData();
          },
          onCancel: () {
            Navigator.of(context).pop();
            _controller_name.clear();
          },
        );
      },
    );
  }

  // function to create a new task
  void createNewTask() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      isScrollControlled: true,
      builder: (context) {
        return ModalDialogBox(
          controller_name: _controller_name,
          controller_description: _controller_description,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();  
            _controller_name.clear();
            _controller_description.clear();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 203, 203),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 1, 31),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('F L U T T E R  D O !', 
              style: TextStyle(
                color: Color.fromARGB(255, 97, 137, 247),
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            // Day of the week
            Text(weekdayName[date.weekday]!,
              style: const TextStyle(
                color: Color.fromARGB(255, 97, 137, 247),
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 1, 1, 31),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("You have ${db.toDoList.length == 1 ? "${db.toDoList.length} task" : "${db.toDoList.length} tasks"} for today",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 1, 1, 31),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(Icons.calendar_month)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][2],
                  onChanged: (value) => checkBoxChange(value, index),
                  deleteFunction: (context) => deleteTask(index),
                  editFunction: (context) => editTask(index),
                );
              } ,
            ),

          ),
        ],
      )
    );
  }
}


// 0xFF1A1A1A