import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';

class ManagementStockView extends StatelessWidget {
  const ManagementStockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  const Expanded(
                    child: XInput(
                      label: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MdiIcons.filterVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "All (100 items)",
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
