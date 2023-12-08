
import 'package:flutter/material.dart';
import 'package:user/constants/styles.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: backButtonStyle,
      onPressed: (){
        Navigator.pop(context);
      },
      child:const Padding(
        padding:  EdgeInsets.all(10),
        child: Text(
          'Back to Login form',
          style: const TextStyle(fontSize: 17,color: Colors.blueAccent),
        ),
      ),
    );
  }
}