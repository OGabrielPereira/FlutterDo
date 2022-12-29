import 'package:flutter/material.dart';
import 'package:flutter_do/utils/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
    
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 214, 214, 214),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
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
                mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: "Cancel", 
                  onPressed: onCancel
                ),
                
                const SizedBox(width: 10),
                // cancel button
                MyButton(
                  text: "Save", 
                  onPressed: onSave
                ),

              ],
            )
          ]
        ),
      ),
    );
  }
}