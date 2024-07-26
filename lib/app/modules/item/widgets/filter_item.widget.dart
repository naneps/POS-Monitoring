import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';

class FilterItemWIdget extends StatelessWidget {
  const FilterItemWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filters",
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(MdiIcons.close, size: 20),
              )
            ],
          ),
          const Divider(),
          //   const SizedBox(height: 10),
          //   const Text("Filter by Status"),
          //   const SizedBox(height: 5),
          //   DropdownButtonFormField(
          //     items: [
          //       ...StockItemStatus.values.map((e) => DropdownMenuItem(
          //             value: e,
          //             child: Text(e.name),
          //           ))
          //     ],
          //     onChanged: (value) {},
          //   ),
          const SizedBox(height: 16),
          const Text("Filter by Category"),
          const SizedBox(height: 5),
          DropdownButtonFormField(
            items: [
              ...[
                'Category 1',
                'Category 2',
                'Category 3',
                'Category 4',
              ].map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          XButton.outline(
            onPressed: () {},
            text: "Save Filters",
            foregroundColor: Theme.of(Get.context!).primaryColor,
            backgroundColor: Colors.white,
            borderSide: BorderSide(
              color: Theme.of(Get.context!).primaryColor,
              style: BorderStyle.solid,
              width: 1,
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            fixedSize: Size(Get.width, 40),
          ),
        ],
      ),
    );
  }
}
