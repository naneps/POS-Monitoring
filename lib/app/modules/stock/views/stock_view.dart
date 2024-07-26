import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/widgets/item_stock_tile..wiget.dart';

import '../controllers/stock_controller.dart';

class StockView extends GetView<StockController> {
  const StockView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getItems();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                scrolledUnderElevation: 0,
                title: const Text("Stock Management"),
                floating: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      showFilter();
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),
              SliverAppBar(
                floating: true,
                toolbarHeight: 0,
                shadowColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                collapsedHeight: 60,
                snap: true,
                pinned: true,
                flexibleSpace: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
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
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "All (100 items out of stock)",
                  ),
                ),
              ),
              controller.obx(
                (context) {
                  return SliverList.separated(
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
                onLoading: const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                onEmpty: const SliverFillRemaining(
                  child: Center(
                    child: Text("No item found"),
                  ),
                ),
                onError: (error) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(error.toString()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showFilter() {}
}
