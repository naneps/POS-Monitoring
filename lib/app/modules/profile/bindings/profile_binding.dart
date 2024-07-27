import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => UserProvider());
  }
}
