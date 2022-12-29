import 'package:flutter/material.dart';

import 'my_button.dart';

// ignore: must_be_immutable
class ModalDialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  ModalDialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 730,
      //border for container 
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 203, 203, 203),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title
              Column(
                children: [
                  const Text(
                      "Add a New Task",
                      style: TextStyle(
                        color: Color.fromARGB(255, 1, 1, 31),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    controller: controller,
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

                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Write a description for your task...", 
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  
                    // Task Time
                    const SizedBox(height: 20),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.access_time),
                                SizedBox(width: 10), 
                                Text(
                                  "Task Time",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "12:00",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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