import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/category.repository.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

class CreateItemController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final itemRepository = Get.find<ItemRepository>();
  final categoryRepo = Get.find<CategoryRepository>();
  RxBool isEdit = false.obs;
  Rx<ItemModel> item = ItemModel().obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxString search = ''.obs;
  void createItem() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await itemRepository.createItem(item.value.toCreateItem());
    }
  }

  void getCategories() async {
    categories.value = await categoryRepo.getCategories();
  }

  void getItem() async {
    if (item.value.id != null) {
      item.value = await itemRepository.getItem(item.value.id.toString());
    } else {
      throw Exception('Item id is null');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
    if (Get.arguments != null) {
      isEdit.value = true;
      item.value = Get.arguments as ItemModel;
      getItem();
      item.refresh();
      print(item.value.category);
    }
  }

  void saveItem() {
    if (isEdit.value) {
      updateItem();
    } else {
      createItem();
    }
  }

  void updateItem() async {
    print(item.value.toUpdateItem());
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await itemRepository.updateItem(
        item.value.toUpdateItem(),
        item.value.id.toString(),
      );
    }
  }
}
