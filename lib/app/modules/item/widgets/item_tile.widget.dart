import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/item/bindings/item_binding.dart';
import 'package:mvvm_getx_pattern/app/modules/item/views/create_item_view.dart';

class ItemTileWidget extends StatelessWidget {
  final ItemModel item;
  final VoidCallback? onDelete;

  const ItemTileWidget({
    super.key,
    required this.item,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(item.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              confirmDelete();
            },
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            flex: 1,
            onPressed: (context) {
              Get.to(
                () => const CreateItemView(),
                binding: ItemBinding(),
                arguments: item,
              );
            },
            foregroundColor: Colors.blue,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          visualDensity: VisualDensity.compact,
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey.shade300),
            ),
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              imageUrl: item.image ?? '',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Image.asset(
                'assets/icons/cubes.png',
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/icons/cubes.png',
              ),
            ),
          ),
          title: Text(item.name ?? '',
              style: Theme.of(context).textTheme.labelMedium),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.formattedPrice,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              Text(
                'Stock: ${item.stock}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  void confirmDelete() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Confirm',
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to delete this item?',
              style: Theme.of(Get.context!).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: XButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: XButton.outline(
                  foregroundColor: Colors.red,
                  borderSide: const BorderSide(color: Colors.red),
                  onPressed: () {
                    onDelete?.call();
                    Get.back();
                  },
                  text: 'Delete',
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
