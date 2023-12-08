import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
   

     on<SubmitLoginButtonClickedEvent>((event, emit) async {
   
      if (event.email == null || event.email.isEmpty) {
        showErrorMessage("Please enter your email address.");
      } else if (!event.email.contains('@')) {
        showErrorMessage("Please enter a valid email address.");
      } else if (event.password == null || event.password.isEmpty) {
        showErrorMessage("Please enter your password.");
      } else if (event.password.length < 8) {
        showErrorMessage("Password must be at least 8 characters long.");
      } else {
        bool isLogin = await login(event.email, event.password);
        print("iuoiytuoytiutiut===========================");
        if (isLogin == true) {
          emit(AuthResultState(true));
        }
      }
     });

     //!
     on<SubmitRegistretiondButtonClickedEvent>((event, emit) async {
      final String email =event.email;
      final String password =event.password;
      final String name =event.name;
      final String gender =event.gender;
      bool isRegister = await register(email,password,name ,gender);
      if (isRegister == true) {
        emit(AuthResultState(true));
      }
    });
  }


    // loginaccount
  Future<bool> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong password provided for that user.');
      } else if (e.code == 'invalid-credential') {
        showErrorMessage(
            'Invalid email address or password. Please try again.');
      } else {
        showErrorMessage('An unknown error occurred. Please try again later.');
      }
      return false;
    }
  }

  // create new account
  Future<bool> register(String emailAddress, String password , String name , String gender) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

    final userId = credential.user?.uid;

    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'email': emailAddress,
      'name': name,
      'gender': gender,
      'userId': userId,
    });

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorMessage('The account already exists for that email.');
      }
      return false;
    }
  }

  // show toast message
  void showErrorMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
}
