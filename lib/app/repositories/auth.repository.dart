import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/providers/auth.provider.dart';
import 'package:mvvm_getx_pattern/app/services/api.service.dart';

class AuthRepository {
  final authProvider = Get.find<AuthProvider>();

  Future<UserModel> login(String phone, String password) async {
    try {
      final res = await authProvider.login(phone, password);
      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 201) {
        if (res.body['data'] != null) {
          final user = res.body['user'];
          final data = res.body['data'];
          ApiService().setToken(data['accessToken']);
          XSnackBar.show(
            context: Get.context!,
            message: data['message'],
            type: SnackBarType.success,
          );
          return UserModel.fromJson(user).copyWith(
            token: data['accessToken'],
          );
        } else {
          XSnackBar.show(
            context: Get.context!,
            message: res.body['message'],
            type: SnackBarType.error,
          );
          throw Exception('Gagal Login');
        }
      } else {
        throw Exception(res.body['data']['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
