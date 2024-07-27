import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/list_item.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/summary_cart.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/widgets/cart_item_tile.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/widgets/payment_cash.widget.dart';

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
                        height: Get.height,
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

                          return CartItemTile(
                            item: item,
                            onRemove: () {
                              controller.cart.value.items!.remove(item);
                            },
                          );
                        },
                      ),
              ),
            ),
            const PaymentCashWidget(),
            const SizedBox(height: 10),
            Obx(() {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.person),
                  trailing: IconButton(
                    onPressed: () {},
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    icon: InkWell(
                      onTap: () {
                        showCustomerForm();
                      },
                      child: Icon(
                        MdiIcons.pencil,
                        size: 20,
                      ),
                    ),
                  ),
                  title: Text(
                    controller.cart.value.customerName!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    controller.cart.value.customerPhone ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ), // customer name
                ),
              );
            }),
            const SummaryCart()
          ],
        ),
      ),
    );
  }

  showCustomerForm() {
    final formKey = GlobalKey<FormState>();
    Get.bottomSheet(Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Customer",
                  style: Theme.of(Get.context!).textTheme.labelMedium,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(),
            XInput(
              label: "Name",
              initialValue: controller.cart.value.customerName,
              onSaved: (value) {
                controller.cart.value.customerName = value;
              },
            ),
            const SizedBox(height: 10),
            XInput(
              label: "Phone",
              initialValue: controller.cart.value.customerPhone,
              onSaved: (value) {
                controller.cart.value.customerPhone = value;
              },
            ),
            const SizedBox(height: 10),
            XButton(
                fixedSize: Size(Get.width, 50),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    controller.cart.refresh();
                    Get.back();
                  }
                },
                text: "Save"),
          ],
        ),
      ),
    ));
  }

  showItem() {
    Get.bottomSheet(
      const ListItem(),
    );
  }
}
