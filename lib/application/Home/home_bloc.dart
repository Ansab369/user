import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:user/models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<User> userFullData = [];

    on<readDataFromJson>((event, emit) async {
      emit(jsonDataReadingState(true));
      userFullData = await parseUsers('assets/users_list.json');
      emit(jsonDataReadingState(false));
      userFullData = [...userFullData]..sort((a, b) => a.name.compareTo(b.name));
      emit(jsonDataRState(userFullData));
    });
    on<SearchTermChanged>((event, emit) async {
      List<User> usersortData = [];
      usersortData = filterAndSortUsers(userFullData, event.filter);
      emit(jsonDataRState(usersortData));
    });
  }

  // load
  Future<List<User>> parseUsers(String filePath) async {
    final String jsonString = await rootBundle.loadString(filePath);
    final response = await jsonDecode(jsonString);
    final users = response['Response']['Users'] as List;
    return users.map((user) => User.fromJson(user)).toList();
  }

  List<User> filterAndSortUsers(List<User> users, String filter) {
   
    final filteredUsers = users
        .where((user) => user.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return filteredUsers;
  }
}
