import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/modules/item/bindings/item_binding.dart';
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
          Get.to(
            const CreateItemView(),
            binding: ItemBinding(),
          );
        },
        child: const Icon(Icons.add),
      ),
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
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
                  child: const Text(
                    "All (100 items)",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: controller.obx(
                  (state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.items.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                      itemBuilder: (context, index) {
                        final item = controller.items[index];
                        return ItemTileWidget(
                          key: ValueKey(item.id),
                          item: item,
                          onDelete: () {
                            controller.deleteItem(item.id.toString());
                          },
                        );
                      },
                    );
                  },
                  onEmpty: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.packageVariantClosed,
                          color: Theme.of(context).colorScheme.onBackground,
                          size: 60,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "No item found",
                        ),
                      ],
                    ),
                  ),
                  onError: (error) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.packageVariantClosed,
                            color: Theme.of(context).colorScheme.onBackground,
                            size: 60,
                          ),
                          const SizedBox(height: 10),
                          Text(error.toString()),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
