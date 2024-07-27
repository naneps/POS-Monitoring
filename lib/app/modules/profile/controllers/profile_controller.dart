import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

class ProfileController extends GetxController with StateMixin<UserModel> {
  final userRepo = Get.find<UserRepository>();
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void getUser() async {
    try {
      user.value = await userRepo.getUser();
      change(user.value, status: RxStatus.success());
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
