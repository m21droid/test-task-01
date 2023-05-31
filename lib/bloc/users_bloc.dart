import 'package:devpace/bloc/users_event.dart';
import 'package:devpace/bloc/users_state.dart';
import 'package:devpace/models/user.dart';
import 'package:devpace/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;

  final listUsers = <User>[];

  UsersBloc({required this.userRepository}) : super(UsersListEmptyState()) {
    on<UsersLoadPageEvent>((event, emit) async {
      emit(UsersLoadingState(listUsers: listUsers));
      try {
        await Future.delayed(
            const Duration(milliseconds: 3000)); // Loading emulation
        final page = await userRepository.getPage(1);
        listUsers.addAll(page.data);
      } catch (_) {
        emit(UsersErrorState());
        await Future.delayed(const Duration(milliseconds: 2000));
      }
      emit(UsersLoadedState(listUsers: listUsers));
    });

    on<UsersLoadUserEvent>((event, emit) async {
      emit(UsersLoadingState(listUsers: listUsers));
      try {
        await Future.delayed(
            const Duration(milliseconds: 500)); // Loading emulation
        final user = await userRepository.getUser(listUsers.length + 1);
        listUsers.add(user);
      } catch (_) {
        emit(UsersErrorState());
        await Future.delayed(const Duration(milliseconds: 2000));
      }
      emit(UsersLoadedState(listUsers: listUsers));
    });

    on<UsersRemoveLastEvent>((event, emit) {
      if (listUsers.isNotEmpty) {
        listUsers.removeLast();
        emit(UsersLoadedState(listUsers: listUsers));
      }
    });

    on<UsersClearAllEvent>((event, emit) {
      listUsers.clear();
      emit(UsersListEmptyState());
    });
  }
}
