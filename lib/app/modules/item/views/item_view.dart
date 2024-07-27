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
      appBar: AppBar(
        title: const Text('Item'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.filter),
            onPressed: showFilter,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getItems();
          },
          child: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    controller.searchTerm.value = value;
                  }),
              const SizedBox(height: 10),
              Expanded(
                child: controller.obx(
                  (state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.filteredItems.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                      itemBuilder: (context, index) {
                        final item = controller.filteredItems[index];
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
                          color: Theme.of(context).colorScheme.onSurface,
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
                            color: Theme.of(context).colorScheme.onSurface,
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
