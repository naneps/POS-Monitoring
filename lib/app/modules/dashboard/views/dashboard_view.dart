import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            StaggeredGrid.count(
              crossAxisCount: 6,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _buildTile(
                  context,
                  icon: MdiIcons.packageVariant,
                  label: 'Items',
                  value: '10',
                  color: Colors.blue,
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                ),
                // Sales Tile
                _buildTile(
                  context,
                  icon: MdiIcons.cashMultiple,
                  label: 'Sales Today',
                  value: '\$1250',
                  color: Colors.green,
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                ),
                // Users Tile
                _buildTile(
                  context,
                  icon: MdiIcons.accountGroup,
                  label: 'Users',
                  value: '200',
                  color: Colors.purple,
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                ),
                // Orders Tile
                _buildTile(
                  context,
                  icon: MdiIcons.cart,
                  label: 'Orders Today',
                  value: '75',
                  color: Colors.orange,
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                ),
                _buildTile(
                  context,
                  icon: MdiIcons.packageVariantPlus,
                  label: 'Item Out of Stock',
                  value: '10',
                  color: Colors.red,
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text("Order Today"),
                        Spacer(),
                        TextButton(
                          onPressed: null,
                          child: Text("View All"),
                        )
                      ],
                    ),
                    // Order List
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text("#$index"),
                            ),
                            title: Text("Jamal $index"),
                            subtitle: Text.rich(
                              TextSpan(
                                children: [
                                  // items
                                  TextSpan(text: "$index Items"),
                                  const TextSpan(text: " | "),

                                  TextSpan(
                                    text: "\$${index * 100}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                          );
                        },
                      ),
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
