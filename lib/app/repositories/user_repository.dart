import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/loading_dialog.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/models/user.provider.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/modules/employe/controllers/employe_controller.dart';

class UserRepository {
  final userProvider = Get.find<UserProvider>();
  List<UserModel> users = [];
  Rx<UserModel> user = UserModel().obs;
  Future<void> createUser(Map<String, dynamic> data) async {
    try {
      LoadingDialog.show(Get.context!);
      final res = await userProvider.createUser(data);
      print("CREATE USER: ");
      print(data);
      print(res.body);
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          if (res.statusCode == 201) {
            XSnackBar.show(
              context: Get.context!,
              message: "Item created successfully",
              type: SnackBarType.success,
            );
          } else {
            XSnackBar.show(
              context: Get.context!,
              message: "Failed to create item",
              type: SnackBarType.error,
            );
          }
        },
      );
      LoadingDialog.hide(Get.overlayContext!);
      Get.back();
      Get.find<EmployeController>().getUsers();
    } catch (e) {
      print(e);
      LoadingDialog.hide(Get.overlayContext!);
    } finally {}
  }

  Future<List<UserModel>> getUsers() async {
    final res = await userProvider.getUsers();
    print("GET USERS: ");
    print(res.body);
    if (res.body['data'] != null) {
      final data = res.body['data'] as List;
      users = data.map((e) => UserModel.fromUser(e)).toList();
    } else {
      users = [];
    }
    return users;
  }

  Future<UserModel> getUser() async {
    final res = await userProvider.getUser();
    print("GET USER: ");
    print(res.body);
    if (res.body['data'] != null) {
      user.value = UserModel.fromUser(res.body['data']);
    } else {
      user.value = UserModel();
    }
    return user.value;
  }
}
