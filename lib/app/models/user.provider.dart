import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class UserProvider extends BaseProvider {
  Future<Response> getUsers() {
    return post('', {});
  }
}
