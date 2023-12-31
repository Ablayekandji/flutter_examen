import 'package:flutter/material.dart';

class BasicButtonComponent extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderdColor;
  final Function() onPressed;

  const BasicButtonComponent(
      {super.key, required this.text, required this.onPressed, this.textColor, this.backgroundColor, this.borderdColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                text,
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ),
          )),
    );
  }
}