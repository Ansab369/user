// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/application/auth/auth_bloc.dart';
import 'package:user/presentstion/home_screen/home_screen.dart';
import 'package:user/presentstion/registretion/widgets/back_to_login_button.dart';
import 'package:user/presentstion/widgets/common_button.dart';
import 'package:user/presentstion/widgets/common_textfield.dart';

class RegistretionScreen extends StatelessWidget {
  const RegistretionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController nameTextController = TextEditingController();
    TextEditingController genderTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthResultState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registration Form',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    commonTextFieldWidget(
                      title: 'Name',
                      hintText: 'Name',
                      textController: nameTextController,
                    ),
                    SizedBox(height: 20),
                    commonTextFieldWidget(
                      title: 'Email',
                      hintText: 'Email',
                      textController: emailTextController,
                    ),
                    SizedBox(height: 20),
                    commonTextFieldWidget(
                      title: 'Gender',
                      hintText: 'Gender',
                      textController: genderTextController,
                    ),
                    SizedBox(height: 20),
                    commonTextFieldWidget(
                      title: 'Password',
                      hintText: 'Enter password',
                      textController: passwordTextController,
                      isPassword: true,
                    ),
                    SizedBox(height: 40),
                    SubmitButton(
                      text: 'Next',
                      onPressed: () async {
                        final email = emailTextController.text;
                        final password = passwordTextController.text;
                        final name = nameTextController.text;
                        final gender = genderTextController.text;
                        // todo : submit to firebase
                        // todo : navigate to home screen

                        context
                            .read<AuthBloc>()
                            .add(SubmitRegistretiondButtonClickedEvent(
                              email,
                              password,
                              name,
                              gender,
                            ));
                      },
                    ),
                    SizedBox(height: 20),
                    BackToLoginButton(),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
