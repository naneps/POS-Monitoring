import 'package:mvvm_getx_pattern/app/models/user.provider.dart';

class UserRepository {
  final userProvider = UserProvider();

  FutureList<UserModel> getUsers() async {
    final res = await userProvider.getUsers();
    return res;
  }
}
