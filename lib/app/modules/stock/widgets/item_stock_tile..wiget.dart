import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/scalled_dialog.dart';
import 'package:mvvm_getx_pattern/app/enums/stock_enum.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/widgets/form_stock.widget.dart';

class ItemStockTileWidget extends StatelessWidget {
  final ItemModel item;
  final bool canEdit;
  const ItemStockTileWidget({
    super.key,
    required this.item,
    this.canEdit = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        onTap: () {},
        dense: true,
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
        title: Text(
          item.name!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: StockItemStatusExtension.fromQuantity(item.stock!).color,
          ),
          constraints: const BoxConstraints(
            maxWidth: 150,
            minWidth: 150,
          ),
          child: Text(
            'Stock: ${item.stock}| ${StockItemStatusExtension.fromQuantity(item.stock!).name}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: StockItemStatusExtension.fromQuantity(item.stock!)
                      .textColor,
                ),
          ),
        ),
        trailing: !canEdit
            ? null
            : IconButton(
                onPressed: () {
                  showFormStock();
                },
                icon: const Icon(Icons.edit),
              ),
      ),
    );
  }

  void showFormStock() {
    Get.dialog(
      ScaleDialog(
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: FormStockWidget(
            item: item,
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
