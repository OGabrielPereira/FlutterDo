import 'package:flutter/material.dart';
import 'package:flutter_do/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      
      body: ListView(
        children: [
          ToDoTile(
            taskName: "Aprender Flutter",
            taskCompleted: false,
            onChanged: (p0) {},
          ),
          ToDoTile(
            taskName: "Fazer Exercícios",
            taskCompleted: true,
            onChanged: (p0) {},
          )
        ]
      ),

    );
  }
}


// 0xFF1A1A1A