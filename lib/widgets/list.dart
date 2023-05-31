import 'dart:developer';

import 'package:devpace/bloc/users_bloc.dart';
import 'package:devpace/bloc/users_state.dart';
import 'package:devpace/models/user.dart';
import 'package:devpace/widgets/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: ((context, state) {
        log(state.toString());
      }),
      builder: (context, state) {
        if (state is UsersListEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is UsersErrorState) {
          return const SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Error loading',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        }
        List<User> listUsers = [];
        if (state is UsersLoadingState) {
          if (state.listUsers.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            listUsers = state.listUsers;
          }
        }
        if (state is UsersLoadedState) {
          listUsers = state.listUsers;
        }
        final itemCount = listUsers.length;
        return ListView.builder(
            padding: const EdgeInsets.all(16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (contex, index) {
              final i = index + 1;
              if (index % 2 == 0) {
                final key = Key('Line $index');
                final user1 = listUsers[index];
                final user2 = (i < itemCount) ? listUsers[i] : null;
                return MyLine(key: key, user1: user1, user2: user2);
              } else {
                final height = (i == itemCount) ? 0.0 : 16.0;
                return SizedBox(height: height);
              }
            },
            itemCount: itemCount);
      },
    );
  }
}
