import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/stock_history.model.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

class HistoryStockController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<StockHistoryModel> items = <StockHistoryModel>[].obs;
  final itemRepository = Get.find<ItemRepository>();
  void loadDummyData() {}

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
    tabController = TabController(length: 2, vsync: this);
    getHistory();
  }

  void getHistory() async {
    items.value = await itemRepository.getStockHistories();
  }
}
