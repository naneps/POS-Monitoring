import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/item/views/create_item_view.dart';
import 'package:mvvm_getx_pattern/app/modules/item/widgets/filter_item.widget.dart';
import 'package:mvvm_getx_pattern/app/modules/item/widgets/item_tile.widget.dart';

import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "create_item",
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Get.to(const CreateItemView());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              scrolledUnderElevation: 0,
              title: const Text("Management Item"),
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
                child: const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "All (100 items)",
                ),
              ),
            ),
            SliverList.separated(
              itemCount: controller.items.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 5);
              },
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return SlidableAutoCloseBehavior(
                  closeWhenTapped: true,
                  closeWhenOpened: true,
                  key: Key(index.toString()),
                  child: ItemTileWidget(item: item),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void showFilter() {
    Get.bottomSheet(
      const FilterItemWIdget(),
    );
  }
}
