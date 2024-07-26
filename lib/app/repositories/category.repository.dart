import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/providers/category.provider.dart';

class CategoryRepository {
  final categoryProvider = Get.find<CategoryProvider>();
  List<CategoryModel> categories = <CategoryModel>[];
  Rx<String> search = ''.obs;
  Future<void> createCategory(Map<String, dynamic> data) async {
    final res = await categoryProvider.createCategory(data);
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: "Category created successfully",
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: "Failed to create category",
        type: SnackBarType.error,
      );
    }
  }

  Future<void> deleteCategory(String id) async {
    final res = await categoryProvider.deleteCategory(id);
    if (res.statusCode == 200) {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.error,
      );
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    final res = await categoryProvider.getCategories();
    if (res.body['data'] != null) {
      final data = res.body['data'] as List;
      categories = data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      categories = [];
    }
    return categories;
  }

  Future<void> updateCategory(formatCategory) async {
    final res = await categoryProvider.updateCategory(
        formatCategory, formatCategory['id'].toString());
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: "Category updated successfully",
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: "Failed to update category",
        type: SnackBarType.error,
      );
    }
  }
}
