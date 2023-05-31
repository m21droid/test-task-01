import 'dart:convert';
import 'dart:math';

import 'package:devpace/models/page.dart';
import 'package:devpace/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  static const endpoint = 'reqres.in';

  final _random = Random();

  Future<Page> getPage(int page) async {
    final url = Uri.https(endpoint, '/api/users', {'data': '{$page}'});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic pageJson = jsonDecode(response.body);
      return Page.fromJson(pageJson);
    } else {
      throw Exception('Bad request');
    }
  }

  Future<User> getUser(int id) async {
    final rest = id % 12; // The database contains only 12 users
    final x = (rest == 0) ? 12 : rest;
    final i = (_random.nextInt(5) == 4) ? -1 : x; // Exception emulation
    final url = Uri.https(endpoint, '/api/users/$i');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic userJson = jsonDecode(response.body);
      return User.fromJson(userJson['data']);
    } else {
      throw Exception('Bad request');
    }
  }
}
