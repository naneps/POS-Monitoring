import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/inc_dec_input.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/widgets/item_stock_tile..wiget.dart';

class FormStockWidget extends StatelessWidget {
  final ItemModel item;
  const FormStockWidget({
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Increase stock"),
                IncDecInput(
                  textSize: 14,
                  iconSize: 30,
                  minValue: item.stock!,
                  maxValue: 10000000,
                  initialValue: item.stock!,
                  onChange: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
          XButton(
            text: "Save Changes",
            fixedSize: Size(Get.width, 30),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
