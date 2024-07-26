import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/loading_dialog.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/item_controller.dart';
import 'package:mvvm_getx_pattern/app/providers/item_provider.dart';

class ItemRepository {
  List<ItemModel> items = <ItemModel>[];
  ItemModel item = ItemModel();
  final itemProvider = Get.find<ItemProvider>();
  Future<void> createItem(Map<String, dynamic> data) async {
    try {
      LoadingDialog.show(Get.context!);
      final res = await itemProvider.createItem(data);
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
      Get.find<ItemController>().getItems();
    } catch (e) {
      print(e);
      LoadingDialog.hide(Get.overlayContext!);
    } finally {}
  }

  Future<void> deleteItem(String id) async {
    final res = await itemProvider.deleteItem(id);
    print(res.body);
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

  Future<ItemModel> getItem(String id) async {
    final res = await itemProvider.getItem(id);
    if (res.body['data'] != null) {
      item = ItemModel.fromJson(res.body['data']);
    } else {
      item = ItemModel();
    }
    return item;
  }

  Future<List<ItemModel>> getItems() async {
    final res = await itemProvider.getItems();
    if (res.body['data'] != null) {
      final data = res.body['data'] as List;
      items = data.map((e) => ItemModel.fromJson(e)).toList();
    } else {
      items = [];
    }
    return items;
  }

  Future<void> updateItem(Map<String, dynamic> data, String id) async {
    final res = await itemProvider.updateItem(data, id);
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: "Item updated successfully",
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: "Failed to update item",
        type: SnackBarType.error,
      );
    }
    Get.back();
  }

  Future<void> updateStockIn(Map<String, dynamic> data, String id) async {
    final res = await itemProvider.updateStockIn(data, id);
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: "Item updated successfully",
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: "Failed to update item",
        type: SnackBarType.error,
      );
    }
    Get.back();
  }
}
