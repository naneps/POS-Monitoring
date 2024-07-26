import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/summary_text.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/controllers/transaction_controller.dart';

class SummaryCart extends GetView<TransactionController> {
  const SummaryCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Obx(() {
        return Column(
          children: [
            SummaryText(
              title: "Total",
              value: controller.cart.value.subtotalFormatted,
            ),
            // charge
            //change
            SummaryText(
              title: "Charge",
              value: controller.cart.value.chargeFormatted,
            ),
            SummaryText(
              title: "Change",
              value: controller.cart.value.changeFormatted,
            ),
          ],
        );
      }),
    );
  }
}
