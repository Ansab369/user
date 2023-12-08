
import 'package:flutter/material.dart';

class commonTextFieldWidget extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController textController;
  final bool isPassword;
  const commonTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    required this.textController,
  });

  @override
  State<commonTextFieldWidget> createState() => _commonTextFieldWidgetState();
}

class _commonTextFieldWidgetState extends State<commonTextFieldWidget> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        SizedBox(height: 5),
        TextField(
          controller: widget.textController,
          obscureText: _showPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                width: 2.0,
              ),
            ),
            hintText: widget.hintText,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _showPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    })
                : SizedBox(),
          ),
        ),
      ],
    );
  }
}


// todo : use poppins text