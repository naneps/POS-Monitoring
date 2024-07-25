import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';

class StockController extends GetxController {
  //TODO: Implement StockController
  RxList<ItemModel> items = <ItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    items.value = generateRealNameDummyItems(generateDummyCategories());
  }
}
