import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.text,
    this.onPressed
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 15.0,
      ),
    );
  }
}
