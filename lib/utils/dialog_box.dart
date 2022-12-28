import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [

            // get user input
            const TextField(
              decoration: InputDecoration(
                  hintText: "Add a New Task",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),

            // buttons -> save and cancel
            Row(
              children: const [
                
              ],
            )
          ]
        ),
      ),
    );
  }
}