import 'package:flutter/material.dart';

class ModalBox extends StatelessWidget {

  final task_name;
  final task_description;
  final task_completed;

  ModalBox({
    super.key,
    required this.task_name,
    required this.task_description,
    required this.task_completed
  });

  void color(bool completed) {
    if (completed) {
      const Color.fromARGB(255, 1, 1, 31);
    } else {
      const Color.fromARGB(255, 1, 1, 31);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //border for container 
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 203, 203, 203),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, AppBar().preferredSize.height, 30, 30),

        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Column(
                children: [
                  Text(
                      task_name,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 1, 1, 31),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  const SizedBox(height: 20),

                  // TASK DESCRIPTION

                  Text(
                    task_description,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 1, 1, 31),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TASK COMPLETED
                  
                  Text(
                    task_completed ? "Completed" : "Incomplete",
                    style: TextStyle(
                      // change color based on task_completed
                      color: task_completed ? Colors.green : Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  ],
              ),

            ]
          ),
        ),
      ),
    );
  }
}