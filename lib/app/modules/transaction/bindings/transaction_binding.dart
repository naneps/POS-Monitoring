import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/item_controller.dart';
import 'package:mvvm_getx_pattern/app/providers/item_provider.dart';
import 'package:mvvm_getx_pattern/app/providers/transaction.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

import '../controllers/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
    Get.lazyPut(() => ItemProvider());
    Get.lazyPut(() => ItemRepository());
    Get.lazyPut(() => ItemController());
    Get.lazyPut(() => TransactionProvider());
  }
}
