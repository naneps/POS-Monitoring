import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/management_controller.dart';

class ManagementView extends GetView<ManagementController> {
  const ManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: controller.navigations.map((item) {
              bool isLastItem = controller.navigations.indexOf(item) ==
                  controller.navigations.length - 1;
              return StaggeredGridTile.count(
                crossAxisCellCount:
                    isLastItem && controller.navigations.length % 2 != 0
                        ? 4
                        : 2,
                mainAxisCellCount: 2,
                child: GestureDetector(
                  onTap: () {
                    if (item.route != null) {
                      Get.toNamed(item.route!);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon!,
                          size: 50,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item.title!,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
