// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:user/presentstion/login_screen/widgets/bottom_text_button.dart';
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    // todo : submit
                  },
                ),
                SizedBox(height: 30),
                bottomTextButton(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
