import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class AuthProvider extends BaseProvider {
  Future<Response> login(String phone, String password) async {
    return await post(
      '/auth/login',
      {'nomor_telepon': phone, 'password': password},
    );
  }
}
