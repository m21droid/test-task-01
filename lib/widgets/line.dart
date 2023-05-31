import 'package:devpace/models/user.dart';
import 'package:devpace/widgets/item.dart';
import 'package:flutter/material.dart';

class MyLine extends StatelessWidget {
  final User user1;
  final User? user2;

  const MyLine({Key? key, required this.user1, required this.user2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstItem = MyItem(user: user1);
    final user = user2;
    final secondItem = (user == null) ? Container() : MyItem(user: user);
    return Row(children: [
      Expanded(flex: 1, child: firstItem),
      const SizedBox(width: 16),
      Expanded(flex: 1, child: secondItem)
    ]);
  }
}
