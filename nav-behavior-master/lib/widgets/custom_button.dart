import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  CustomButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.indigo,
      minWidth: 200,
      height: 50,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
