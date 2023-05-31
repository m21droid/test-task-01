import 'package:devpace/bloc/users_bloc.dart';
import 'package:devpace/bloc/users_event.dart';
import 'package:devpace/services/user_repository.dart';
import 'package:devpace/widgets/action_bar.dart';
import 'package:devpace/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UsersBloc(userRepository: context.read<UserRepository>())
              ..add(UsersLoadPageEvent()),
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: const MyBody(),
            floatingActionButton: const MyFloatingActionButton(),
          ),
        ),
      ),
    );
  }
}
