import 'package:flutter/material.dart';

final mainButtonStyle = TextButton.styleFrom(
  elevation: 8,
           shadowColor: const Color.fromARGB(255, 254, 14, 94),
  minimumSize: const Size(double.infinity, 40),
  foregroundColor: Colors.white,
  backgroundColor: Colors.pink,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  ),
);