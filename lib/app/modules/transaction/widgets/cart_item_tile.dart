import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onRemove;
  const CartItemTile({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(MdiIcons.packageVariantClosed),
      title: Text(item.item!.name!),
      subtitle: Text(item.item!.formattedPrice),
      trailing: Obx(() {
        return SizedBox(
            width: 120,
            child: Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(20, 20)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    item.qty!.value--;
                    if (item.qty!.value == 0) {
                      onRemove();
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
                    borderRadius: BorderRadius.circular(5),
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
                    fixedSize: MaterialStateProperty.all(const Size(20, 20)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  ),
                  onPressed: () {
                    item.qty!.value++;
                  },
                  icon: Icon(MdiIcons.plus),
                ),
              ],
            ));
      }),
    );
  }
}
