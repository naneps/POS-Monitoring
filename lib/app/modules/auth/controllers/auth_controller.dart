import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/painters/loading_dialog.dart';
import 'package:mvvm_getx_pattern/app/models/user.model.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';

class AuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement AuthController
  Rx<UserModel> user = UserModel().obs;
  late TabController tabController;
  final formKey = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  final storage = GetStorage();
  void login() async {
    LoadingDialog.show(Get.context!);
    Future.delayed(const Duration(seconds: 1), () {
      LoadingDialog.hide(Get.context!);
      storage.write('token', "xxx");
      Get.offAllNamed(Routes.CORE);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}
