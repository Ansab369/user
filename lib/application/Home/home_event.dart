part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class readDataFromJson extends HomeEvent {}


class SearchTermChanged extends HomeEvent {
  final String filter;

   SearchTermChanged(this.filter);
}