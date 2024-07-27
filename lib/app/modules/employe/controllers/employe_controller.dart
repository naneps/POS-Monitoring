import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

class EmployeController extends GetxController
    with StateMixin<List<UserModel>> {
  //TODO: Implement EmployeController
  RxList<UserModel> users = <UserModel>[].obs;
  final userRepo = Get.find<UserRepository>();
  void getUsers() async {
    try {
      final res = await userRepo.getUsers();
      if (res.isEmpty) {
        users.value = [];
        change(users, status: RxStatus.empty());
        return;
      } else {
        change(res, status: RxStatus.success());
        users.value = res;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsers();
  }
}
