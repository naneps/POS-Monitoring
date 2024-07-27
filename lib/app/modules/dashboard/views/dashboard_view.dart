import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/modules/dashboard/controllers/list_transaction.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/all_transaction_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Obx(() {
              return StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildTile(
                    context,
                    icon: MdiIcons.packageVariant,
                    label: 'Items',
                    value: controller.dashboardSummary.value.totalBarang
                        .toString(),
                    color: Colors.blue,
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                  ),
                  // Sales Tile
                  _buildTile(
                    context,
                    icon: MdiIcons.cart,
                    label: 'Orders Today',
                    value: controller.dashboardSummary.value.totalTransaksi
                        .toString(),
                    color: Colors.orange,
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                  ),
                  // Users Tile
                  _buildTile(
                    context,
                    icon: MdiIcons.accountGroup,
                    label: 'Users',
                    value: (controller.dashboardSummary.value.totalOfficer! +
                            controller.dashboardSummary.value.totalOwner!)
                        .toString(),
                    color: Colors.purple,
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                  ),
                  // Orders Tile
                  _buildTile(
                    context,
                    icon: MdiIcons.cash,
                    label: 'Sales Today',
                    value: controller
                        .dashboardSummary.value.totalTransaksiPaidFormatted
                        .toString(),
                    color: Colors.green,
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 2,
                  ),
                  _buildTile(
                    context,
                    icon: MdiIcons.packageVariantPlus,
                    label: 'Item Out of Stock',
                    value: controller.dashboardSummary.value.totalOutOfStock
                        .toString(),
                    color: Colors.red,
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 2,
                  ),
                ],
              );
            }),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Order Today"),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(
                              const AllTransactionView(),
                              fullscreenDialog: true,
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: const Text("View All"),
                        )
                      ],
                    ),
                    // Order List
                    const Expanded(
                      child: ListTransaction(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required int crossAxisCellCount,
    required int mainAxisCellCount,
  }) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
