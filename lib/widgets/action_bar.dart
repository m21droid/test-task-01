import 'package:devpace/bloc/users_bloc.dart';
import 'package:devpace/bloc/users_event.dart';
import 'package:devpace/bloc/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        final isEnable =
            !(state is UsersLoadingState || state is UsersErrorState);
        final color = (isEnable)
            ? Theme.of(context).floatingActionButtonTheme.backgroundColor
            : Colors.grey;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: color,
                onPressed: () {
                  if (isEnable) {
                    final usersBloc = context.read<UsersBloc>();
                    usersBloc.add(UsersLoadUserEvent());
                  }
                },
                heroTag: "plus",
                child: const Icon(Icons.add)),
            const SizedBox(height: 16),
            FloatingActionButton(
                backgroundColor: color,
                onPressed: () {
                  if (isEnable) {
                    final usersBloc = context.read<UsersBloc>();
                    usersBloc.add(UsersRemoveLastEvent());
                  }
                },
                heroTag: "minus",
                child: const Icon(Icons.remove)),
          ],
        );
      },
    );
  }
}
