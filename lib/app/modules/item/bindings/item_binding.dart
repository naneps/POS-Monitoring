import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/create_item_controller.dart';

import '../controllers/item_controller.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateItemController>(
      () => CreateItemController(),
    );

    Get.lazyPut<ItemController>(
      () => ItemController(),
    );
  }
}
