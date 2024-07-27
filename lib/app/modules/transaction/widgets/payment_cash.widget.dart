import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/controllers/transaction_controller.dart';

class CashModel {
  String? name;
  int? value;
  CashModel({
    this.name,
    this.value,
  });
}

class PaymentCashController extends GetxController {
  RxBool showCashInput = false.obs;
  RxInt grandTotal = 0.obs;
  RxInt cash = 0.obs;
  final cashController = TextEditingController();
  final transactionController = Get.find<TransactionController>();
  RxList<CashModel> cashList = <CashModel>[].obs;
  PaymentCashController();
  void generateCash() {
    cashList.clear();
    List<int> predefinedCashList = nextClosestIntegers(grandTotal.value);

    cashList.insert(
      0,
      CashModel(
        name: CurrencyFormatter(
          CurrencyType.idr,
          withSymbol: true,
        ).formatValue(grandTotal.value.toString()),
        value: grandTotal.value,
      ),
    );
    for (int value in predefinedCashList) {
      cashList.add(
        CashModel(
          name: CurrencyFormatter(
            CurrencyType.idr,
            withSymbol: true,
          ).formatValue(value.toString()),
          value: value,
        ),
      );
    }

    print(cashList);
    update(); // Notify listeners that the cashList has been updated
  }

  List<int> nextClosestIntegers(int number) {
    List<int> result = [];
    int closest = ((number / 5000).ceil()) * 5000;

    for (int i = 0; i < 11; i++) {
      if (i.isEven) {
        closest += 10000;
      } else {
        closest += 15000;
      }
      result.add(closest);
    }

    return result;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    grandTotal.value = transactionController.cart.value.grandTotal!.value;
    generateCash();
    transactionController.cart.value.grandTotal!.listen((receipt) {
      grandTotal.value = receipt;
      generateCash();
    });
  }
}

class PaymentCashWidget extends GetView<PaymentCashController> {
  const PaymentCashWidget({super.key});

  @override
  get controller => Get.put(PaymentCashController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: controller.showCashInput.value ? 90 : 50,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Cash",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 5,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cashList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.cash.value =
                                  controller.cashList[index].value!;
                              controller.transactionController.cart.value
                                  .charge!.value = controller.cash.value;
                              controller.transactionController
                                  .calculateChange();
                            },
                            child: Obx(() {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: controller.cash.value ==
                                          controller.cashList[index].value!
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.cashList[index].name!,
                                    style: TextStyle(
                                      color: controller.cash.value ==
                                              controller.cashList[index].value!
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        fixedSize: const Size(20, 20),
                      ),
                      onPressed: () {
                        controller.showCashInput.toggle();
                        controller.cashController.value =
                            const TextEditingValue(
                          text: "0",
                        );
                      },
                      icon: Obx(() {
                        return Icon(
                          controller.showCashInput.value
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 20,
                        );
                      }),
                    )
                  ],
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.showCashInput.value,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      InputCurrency(
                        label: "Tunai",
                        initialValue: "0",
                        controller: controller.cashController,
                        onChanged: (value) {
                          controller.cash.value = int.parse(value);
                          controller.transactionController.cart.value.charge!
                              .value = controller.cash.value;
                          controller.transactionController.calculateChange();
                        },
                        currencyType: CurrencyType.idr,
                      ),
                    ],
                  ),
                );
              })
            ],
          );
        }),
      );
    });
  }
}
