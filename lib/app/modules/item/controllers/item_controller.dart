import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

class ItemController extends GetxController with StateMixin<List<ItemModel>> {
  RxList<ItemModel> items = <ItemModel>[].obs;
  final itemRepository = Get.find<ItemRepository>();
  void deleteItem(String id) async {
    await itemRepository.deleteItem(id);
    getItems();
  }

  void getItems() async {
    try {
      final res = await itemRepository.getItems();
      if (res.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(res, status: RxStatus.success());
        items.assignAll(res);
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getItems();
  }
}
