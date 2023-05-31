import '../models/user.dart';

abstract class UsersState {}

class UsersListEmptyState extends UsersState {}

class UsersLoadingState extends UsersState {
  List<User> listUsers;

  UsersLoadingState({required this.listUsers});
}

class UsersLoadedState extends UsersState {
  List<User> listUsers;

  UsersLoadedState({required this.listUsers});
}

class UsersErrorState extends UsersState {}
