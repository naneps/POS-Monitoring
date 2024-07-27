import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';
import 'package:mvvm_getx_pattern/app/services/api.service.dart';

class UserProvider extends BaseProvider {
  Future<Response> createUser(Map<String, dynamic> data) {
    return post('/auth/create/user', data);
  }

  Future<Response> getUsers() {
    return post('/user/all', {});
  }

  Future<Response> getUser() {
    return post('/auth/${ApiService().uId}/detail_profile', {});
  }
}
