import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';

class ItemController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    items.value = generateRealNameDummyItems(generateDummyCategories());
  }
}
