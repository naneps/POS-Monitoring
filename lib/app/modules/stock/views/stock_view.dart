import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/widgets/item_stock_tile..wiget.dart';

import '../controllers/stock_controller.dart';

class StockView extends GetView<StockController> {
  const StockView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: showFilter,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getItems();
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              key: const Key('search-bar'),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: controller.obx(
                (context) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    itemCount: controller.items.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return ItemStockTileWidget(item: item);
                    },
                  );
                },
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onEmpty: const Center(
                  child: Text("No item found"),
                ),
                onError: (error) {
                  return Center(
                    child: Text(error.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFilter() {}
}
