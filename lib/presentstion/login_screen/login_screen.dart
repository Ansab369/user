// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:user/constants/styles.dart';
import 'package:user/presentstion/registretion/registretion_screen.dart';
import 'package:user/presentstion/widgets/common_button.dart';
import 'package:user/presentstion/widgets/common_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            commonTextFieldWidget(
              title: 'Username/Email ID',
              hintText: 'Enter username or email ID',
              textController: emailTextController,
            ),
            SizedBox(height: 30),
            commonTextFieldWidget(
              title: 'Password',
              hintText: 'Enter password',
              textController: passwordTextController,
              isPassword: true,
            ),
            SizedBox(height: 70),
            SubmitButton(
              text: 'Submit',
              onPressed: () async {
                final email = emailTextController.text;
                final password = passwordTextController.text;
              },
            ),
            SizedBox(height: 30),
            Row(
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
            )
          ],
        ),
      )),
    );
  }
}
