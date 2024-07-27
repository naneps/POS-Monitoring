import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/summary_text.dart';
import 'package:mvvm_getx_pattern/app/models/transaction_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/transaction_repository.dart';

class ListTransaction extends GetView<ListTransactionController> {
  const ListTransaction({super.key});

  @override
  get controller => Get.put(ListTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            final transaction = controller.transactions[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(transaction.idTransaksi.toString()),
              ),
              title: Text("By ${transaction.namaUser}"),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    // items
                    TextSpan(text: "${transaction.details!.length} Items"),
                    const TextSpan(text: " | "),

                    TextSpan(
                      text: transaction.formattedTotalAmount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: InkWell(
                child: const Icon(Icons.chevron_right),
                onTap: () {
                  showDetail(transaction);
                },
              ),
            );
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text(error.toString())),
      ),
    );
  }

  showDetail(TransactionModel transaction) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: Get.height * 0.7,
        color: Colors.white,
        child: Column(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}

class ListTransactionController extends GetxController
    with StateMixin<List<TransactionModel>> {
  final transactionRepo = Get.find<TransactionRepository>();
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTransactions();
  }

  void getTransactions() async {
    change(null, status: RxStatus.loading());
    final res = await transactionRepo.getTransactions();
    if (res.isEmpty) {
      transactions.value = [];
      change(transactions.value, status: RxStatus.empty());
      return;
    } else {
      transactions.value = res;
      change(transactions.value, status: RxStatus.success());
    }
  }
}

// Make sure you have the following in your TransactionModel

