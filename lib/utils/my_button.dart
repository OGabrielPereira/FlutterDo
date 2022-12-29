import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    
    return MaterialButton(
      height: 60.0,
      minWidth: 150.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      onPressed: onPressed,
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 214, 214, 214),
          fontSize: 18,
          fontWeight: FontWeight.w400,
        )
      ),
    );
  }
}