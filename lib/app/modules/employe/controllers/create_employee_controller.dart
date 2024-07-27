import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

class CreateEmployeeController extends GetxController {
  final userRepo = Get.find<UserRepository>();
  Rx<UserModel> user = UserModel().obs;
  final formKey = GlobalKey<FormState>();
  void createUser() async {
    try {
      await userRepo.createUser(user.value.toCreateUser());
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user.value = UserModel();
  }
}
