import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.bakgroundColor,
    required this.textColor,
    required this.borderRadius,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final Color bakgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        color: bakgroundColor,
        borderRadius: borderRadius,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
