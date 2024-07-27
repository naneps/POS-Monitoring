import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

class ItemController extends GetxController with StateMixin<List<ItemModel>> {
  final itemRepository = Get.find<ItemRepository>();
  RxList<ItemModel> items = <ItemModel>[].obs;
  RxList<ItemModel> filteredItems = <ItemModel>[].obs;
  RxString searchTerm = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getItems();
    searchTerm.listen((value) {
      filterItems();
    });
  }

  void getItems() async {
    final res = await itemRepository.getItems();
    if (res.isEmpty) {
      items.value = [];
      filteredItems.value = [];
      change(filteredItems, status: RxStatus.empty());
    } else {
      items.value = res;
      filterItems();
    }
  }

  void filterItems() {
    if (searchTerm.isEmpty) {
      filteredItems.value = items;
    } else {
      filteredItems.value = items
          .where((item) =>
              item.name!.toLowerCase().contains(searchTerm.value.toLowerCase()))
          .toList();
    }
    change(filteredItems, status: RxStatus.success());
  }

  void deleteItem(String id) async {
    await itemRepository.deleteItem(id);
    getItems();
  }
}
