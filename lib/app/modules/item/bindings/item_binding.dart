import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/create_item_controller.dart';
import 'package:mvvm_getx_pattern/app/providers/category.provider.dart';
import 'package:mvvm_getx_pattern/app/providers/item_provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/category.repository.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

import '../controllers/item_controller.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateItemController());
    Get.lazyPut(() => ItemController());
    Get.lazyPut(() => ItemProvider());
    Get.lazyPut(() => ItemRepository());
    Get.lazyPut(() => CategoryRepository());
    Get.lazyPut(() => CategoryProvider());
  }
}
