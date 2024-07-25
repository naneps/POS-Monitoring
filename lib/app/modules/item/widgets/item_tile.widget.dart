import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';

class ItemTileWidget extends StatelessWidget {
  final ItemModel item;
  const ItemTileWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    int stock = Random().nextInt(100);
    return Slidable(
      key: const ValueKey(0),
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          // update delete
          SlidableAction(
            flex: 1,
            onPressed: null,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),

          SlidableAction(
            flex: 1,
            onPressed: null,
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
              imageUrl: item.image!,
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
          title:
              Text(item.name!, style: Theme.of(context).textTheme.labelMedium),
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
                'Stock: $stock',
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
}
