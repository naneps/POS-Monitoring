import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/controllers/history_stock_controller.dart';
import 'package:mvvm_getx_pattern/app/providers/item_provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

import '../controllers/stock_controller.dart';

class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryStockController>(
      () => HistoryStockController(),
    );
    Get.lazyPut<StockController>(
      () => StockController(),
    );
    Get.lazyPut(() => ItemProvider());
    Get.lazyPut(() => ItemRepository());
  }
}
