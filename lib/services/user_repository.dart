import 'package:devpace/models/page.dart';
import 'package:devpace/models/user.dart';
import 'package:devpace/services/user_api_provider.dart';

class UserRepository {
  final _userProvider = UserProvider();

  Future<Page> getPage(int id) => _userProvider.getPage(id);

  Future<User> getUser(int id) => _userProvider.getUser(id);
}
