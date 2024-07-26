import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/list_item.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/summary_cart.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showItem();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(Get.width, 40),
            ),
          ),
          onPressed: () {
            controller.checkout();
          },
          child: const Text("Checkout"),
        ),
      ],
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => controller.cart.value.items!.isEmpty
                    ? Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.cartOutline,
                              color: Colors.grey.shade300,
                              size: 100,
                            ),
                            const Text("Cart is empty"),
                            const Text("Start adding items"),
                          ],
                        ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.cart.value.items!.length,
                        itemBuilder: (context, index) {
                          final item = controller.cart.value.items![index];
                          return Obx(() {
                            return ListTile(
                              leading: Icon(MdiIcons.packageVariantClosed),
                              title: Text(item.item!.name!),
                              subtitle: Text(item.item!.formattedPrice),
                              trailing: SizedBox(
                                  width: 120,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        padding: const EdgeInsets.all(0),
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(20, 20)),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(0)),
                                        ),
                                        onPressed: () {
                                          item.qty!.value--;
                                          if (item.qty!.value == 0) {
                                            controller.removeItemFromCart(item);
                                          }
                                        },
                                        icon: Icon(
                                          item.qty!.value == 1
                                              ? MdiIcons.trashCanOutline
                                              : MdiIcons.minus,
                                          color: item.qty!.value == 1
                                              ? Colors.red
                                              : Get.theme.primaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            item.qty!.value.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(20, 20)),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(0)),
                                        ),
                                        onPressed: () {
                                          item.qty!.value++;
                                        },
                                        icon: Icon(MdiIcons.plus),
                                      ),
                                    ],
                                  )),
                            );
                          });
                        },
                      ),
              ),
            ),
            const SummaryCart()
          ],
        ),
      ),
    );
  }

  showItem() {
    Get.bottomSheet(
      const ListItem(),
    );
  }
}
