import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/auth.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/auth.repository.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => AuthRepository());
  }
}
