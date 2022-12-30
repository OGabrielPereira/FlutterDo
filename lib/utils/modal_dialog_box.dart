import 'package:flutter/material.dart';

import 'my_button.dart';

// ignore: must_be_immutable
class ModalDialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final String modal_title;
  final controller_name;
  final controller_description;
  VoidCallback onSave;
  VoidCallback onCancel;

  ModalDialogBox({
    super.key,
    required this.modal_title,
    required this.controller_name,
    required this.controller_description,
    required this.onSave,
    required this.onCancel
  });

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
                      modal_title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 1, 1, 31),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  const SizedBox(height: 20),
                  // TASK NAME
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    controller: controller_name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    
                    ),
                    decoration: InputDecoration(
                        hintText: "Task name...",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0), 
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        
                      ),
                    ),
                  const SizedBox(height: 20),
                  // TASK DESCRIPTION
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10, 
                    minLines: 7, 
                    controller: controller_description,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    
                    ),
                    decoration: InputDecoration(
                        hintText: "Write your task description here... ",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0), 
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        
                      ),
                    ),
                  ],
              ),
              // get user input

              // buttons -> save and cancel
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // save button
                  MyButton(
                    text: "Cancel", 
                    onPressed: onCancel
                  ),
                  
                  const SizedBox(width: 10),
                  // cancel button
                  MyButton(
                    text: "Save task",
                    onPressed: onSave
                  ),

                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}