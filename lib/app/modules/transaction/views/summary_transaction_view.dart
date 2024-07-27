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
          style: const ButtonStyle(
            fixedSize: WidgetStatePropertyAll(
              Size(double.infinity, 40),
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
            fixedSize: const WidgetStatePropertyAll(
              Size(double.infinity, 40),
            ),
            backgroundColor: WidgetStatePropertyAll(Colors.green[300]),
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
            child: Obx(() {
              if (controller.transaction.value.idTransaksi == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final transaction = controller.transaction.value;
                return Column(
                  children: [
                    Text("Receipt No: ${transaction.idTransaksi}"),
                    SummaryText(
                      title: "Cashier",
                      value: transaction.namaUser ?? "N/A",
                    ),
                    SummaryText(
                      title: "Date",
                      value: transaction.tanggalTransaksi ?? "N/A",
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 5);
                        },
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: transaction.details?.length ?? 0,
                        itemBuilder: (context, index) {
                          final detail = transaction.details![index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(detail.nama ?? "Item $index"),
                                      Text(detail.formattedAmount),
                                    ],
                                  ),
                                ),
                                Text("x${detail.qty} | "),
                                Text(detail.formatTotalAmount),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    SummaryText(
                      title: "Total Transaction",
                      value: transaction.formattedTotalAmount,
                    ),
                    SummaryText(
                      title: "Total Item",
                      value: transaction.details?.length.toString() ?? "0",
                    ),
                    SummaryText(
                      title: "Total Payment",
                      value: transaction.formattedInAmount,
                    ),
                    SummaryText(
                      title: "Total Change",
                      value: transaction.formattedReturnAmount,
                    ),
                  ],
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
