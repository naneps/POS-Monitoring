import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

class EmployeController extends GetxController {
  //TODO: Implement EmployeController
  RxList<UserModel> users = <UserModel>[].obs;
  final userRepo = Get.find<UserRepository>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getUsers() async {
    try {
      final res = await userRepo.getUsers();
      if (res.isEmpty) {
        users.value = [];
      } else {
        users.value = res;
      }
    } catch (e) {
      print(e);
    }
  }
}
