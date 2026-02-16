import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final Color backColor;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.backColor = Colors.black26,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      color: backColor,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
