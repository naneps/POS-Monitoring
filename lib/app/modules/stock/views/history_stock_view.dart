import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/stock_history.model.dart';
import 'package:mvvm_getx_pattern/app/providers/item_provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

import '../controllers/history_stock_controller.dart';

class HistoryStockView extends GetView<HistoryStockController> {
  const HistoryStockView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemRepository());
    Get.put(ItemProvider());
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            key: const Key('search-bar'),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return ListTile(
                    leading: Icon(
                      item.category!.icon,
                      color: item.category!.color,
                    ),
                    title: Text(
                      item.itemName ?? '',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: item.category!.name,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: " ${item.quantity} | ",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              TextSpan(
                                text: " By ${item.author}",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${item.date} ${item.time!}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
