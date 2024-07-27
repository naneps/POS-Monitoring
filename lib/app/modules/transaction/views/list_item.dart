import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/controllers/transaction_controller.dart';

class ListItem extends GetView<TransactionController> {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        initState: (_) {
          controller.getItems();
        },
        builder: (ctrl) {
          return Container(
            padding: const EdgeInsets.all(10),
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("List Item"),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(MdiIcons.close),
                    )
                  ],
                ),
                const Divider(),
                const XInput(
                  label: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return Obx(() {
                        return ListTile(
                          dense: true,
                          selected: controller.cart.value.items!.any(
                            (element) => element.item!.id == item.id,
                          ),
                          selectedColor: Theme.of(context).primaryColor,
                          selectedTileColor: Theme.of(context).primaryColor,
                          visualDensity: VisualDensity.compact,
                          title: Text(item.name!),
                          subtitle: Text(
                              "${item.formattedPrice} | Stok ${item.stock}"),
                          trailing: IconButton(
                            onPressed: () {
                              //   controller.deleteItem(item);
                              if (item.stock! < 1) return;
                              controller.addItemToCart(
                                CartItemModel(
                                  id: item.id,
                                  qty: 1.obs,
                                  item: item,
                                ),
                              );
                            },
                            icon: Icon(MdiIcons.plus),
                          ),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
