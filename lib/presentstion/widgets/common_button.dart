
import 'package:flutter/material.dart';
import 'package:user/constants/styles.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: mainButtonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
