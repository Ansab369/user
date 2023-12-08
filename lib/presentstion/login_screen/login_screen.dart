import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/application/auth/auth_bloc.dart';
import 'package:user/presentstion/home_screen/home_screen.dart';
import 'package:user/presentstion/login_screen/widgets/bottom_text_button.dart';
import 'package:user/presentstion/widgets/common_button.dart';
import 'package:user/presentstion/widgets/common_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
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
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
                    commonTextFieldWidget(
                      title: 'Username/Email ID',
                      hintText: 'Enter username or email ID',
                      textController: emailTextController,
                    ),
                    const SizedBox(height: 30),
                    commonTextFieldWidget(
                      title: 'Password',
                      hintText: 'Enter password',
                      textController: passwordTextController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 70),
                    SubmitButton(
                      text: 'Submit',
                      onPressed: () async {
                        final email = emailTextController.text;
                        final password = passwordTextController.text;
                        context
                            .read<AuthBloc>()
                            .add(SubmitLoginButtonClickedEvent(
                              email,
                              password,
                            ));
                      },
                    ),
                    const SizedBox(height: 30),
                    const bottomTextButton(),
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
