import 'package:devpace/models/user.dart';
import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  final User user;

  const MyItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Text('${user.lastName} ${user.id}'),
    );
  }
}
