import 'package:devpace/models/user.dart';

class Page {
  int page;
  List<User> data;

  Page({required this.page, required this.data});

  factory Page.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'];
    return Page(
      page: json['page'],
      data: data.map((json) => User.fromJson(json)).toList(),
    );
  }
}
