part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


//! SignIN
class SubmitLoginButtonClickedEvent extends AuthEvent {
  final String email;
  final String password;

  SubmitLoginButtonClickedEvent(
    this.email, 
    this.password
    );
}

//! SignUP

class SubmitRegistretiondButtonClickedEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String gender;

  SubmitRegistretiondButtonClickedEvent(
  this.email, 
  this.password,
  this.name,
  this.gender,
  );
}
