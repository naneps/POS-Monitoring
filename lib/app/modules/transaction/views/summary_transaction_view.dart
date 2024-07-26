import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/summary_text.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/controllers/summary_transaction_controller.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';

class SummaryTransactionView extends GetView<SummaryTransactionController> {
  const SummaryTransactionView({super.key});

  @override
  get controller => Get.put(SummaryTransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary Transaction'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.CORE);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      persistentFooterButtons: [
        // back
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
              Size(Get.width, 40),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text("Back"),
        ),
        // print
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
              Size(Get.width, 40),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.green[300]),
          ),
          onPressed: () {
            // controller.print();
          },
          child: const Text("Print"),
        ),
      ],
      body: Column(
        children: [
          Container(
            height: Get.height * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Toko Jamal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Receipt No: 1234567890"),
                const SummaryText(
                  title: "Cashier",
                  value: "Admin",
                ),
                const SummaryText(
                  title: "Date",
                  value: "2021-10-10",
                ),
                const SummaryText(
                  title: "Time",
                  value: "10:10:10",
                ),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Item $index"),
                                  const Text("Rp 10.000"),
                                ],
                              ),
                            ),
                            const Text("x1 | "),
                            const Text("Rp 10.000"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                const SummaryText(
                  title: "Total Transaction",
                  value: "Rp 100.000",
                ),
                const SummaryText(
                  title: "Total Item",
                  value: "10",
                ),
                const SummaryText(
                  title: "Total Payment",
                  value: "Rp 100.000",
                ),
                const SummaryText(
                  title: "Total Change",
                  value: "Rp 0",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
