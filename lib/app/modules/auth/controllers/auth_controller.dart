import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/loading_dialog.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/auth.repository.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement AuthController
  Rx<UserModel> user = UserModel().obs;
  late TabController tabController;
  final formKey = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  final storage = GetStorage();
  final authRepository = Get.find<AuthRepository>();
  void login() async {
    try {
      LoadingDialog.show(Get.context!);
      final user = await authRepository.login(
          this.user.value.phone!, this.user.value.password!);
      if (user.id != null) {
        Get.offAllNamed(Routes.CORE);
      } else {
        LoadingDialog.hide(Get.overlayContext!);
      }
    } catch (e) {
      LoadingDialog.hide(Get.overlayContext!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}
