import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/category.repository.dart';

class CategoryController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final categoryRepo = Get.find<CategoryRepository>();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<CategoryModel> category = CategoryModel().obs;
  final formKey = GlobalKey<FormState>();
  void createCategory() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await categoryRepo.createCategory(category.value.toFormatCategory());
      getCategories();
    }
  }

  void deleteCategory(int id) async {
    await categoryRepo.deleteCategory(id.toString());
    getCategories();
  }

  void getCategories() async {
    try {
      final res = await categoryRepo.getCategories();
      if (res.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(res, status: RxStatus.success());
        categories.assignAll(res);
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void updateCategory() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      categoryRepo.updateCategory(category.value.toFormatCategory());
      getCategories();
    }
  }
}
