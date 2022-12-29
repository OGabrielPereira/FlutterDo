import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      
      child: Slidable(

        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction, 
              label: "Edit", 
              icon: Icons.edit,
              backgroundColor: const Color.fromARGB(255, 31, 30, 30),
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteFunction, 
              label: "Delete", 
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 199, 26, 26),
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        
        child: Container(
          padding: const EdgeInsets.all(16),
          
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 181, 181, 181),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //checkbox
                  Checkbox(
                    value: taskCompleted, 
                    onChanged: onChanged,
                    activeColor: const Color.fromARGB(216, 0, 0, 0),
                  ),
                  //task name
                  Text(
                    taskName, 
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      decoration: taskCompleted 
                        ? TextDecoration.lineThrough 
                        : TextDecoration.none
                    )
                  ),
                  // left arrow
                ],
              ),
                // const Text("<", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400)),
                const Icon(Icons.arrow_back_ios, size: 22),
            ],
          ),
        ),
      ),
    );
  }
}