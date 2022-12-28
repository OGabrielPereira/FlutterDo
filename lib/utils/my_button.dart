import 'package:flutter/material.dart';

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