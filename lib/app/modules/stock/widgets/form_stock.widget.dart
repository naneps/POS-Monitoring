import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/inc_dec_input.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/controllers/stock_controller.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/widgets/item_stock_tile..wiget.dart';

class FormStockWidget extends GetView<StockController> {
  final ItemModel item;
  int stock = 0;
  FormStockWidget({
    super.key,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text(
                "Update Stock",
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(Get.overlayContext!).pop();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ItemStockTileWidget(
              item: item,
              canEdit: false,
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                // currentstck
                TextSpan(
                  text: "Current Stock: ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextSpan(
                  text: item.stock.toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Increase stock"),
                IncDecInput(
                  minValue: 1,
                  maxValue: 10000000,
                  initialValue: 1,
                  onChange: (value) {
                    stock = value;
                    item.stock = value;
                  },
                ),
              ],
            ),
          ),
          XButton(
            text: "Save Changes",
            fixedSize: Size(Get.width, 30),
            onPressed: () {
              controller.stockIn(item);
            },
          ),
        ],
      ),
    );
  }
}
