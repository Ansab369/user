part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

 class jsonDataReadingState extends HomeState {
  final bool isReading ;
  jsonDataReadingState(this.isReading);

}
 class jsonDataRState extends HomeState {
  final List<User> userDataList ;
  jsonDataRState(this.userDataList);

}
