
import 'package:flutter/material.dart';
import 'package:user/presentstion/registretion/registretion_screen.dart';

class bottomTextButton extends StatelessWidget {
  const bottomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Not registered yet? ',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegistretionScreen()));
          },
          child: Text(
            'Create an account',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
