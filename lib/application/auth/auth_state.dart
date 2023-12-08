part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

 class AuthResultState extends AuthState {
 final bool isAuthenticated ;
  AuthResultState(this.isAuthenticated);
 }