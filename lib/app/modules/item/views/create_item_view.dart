import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_media/enums.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_media/input_media.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/create_item_controller.dart';

class CreateItemView extends GetView<CreateItemController> {
  const CreateItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "create_item",
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Create Item"),
          actions: [
            IconButton(
              icon: Icon(MdiIcons.close),
              onPressed: () => Get.back(),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const XInput(
                  label: "Name",
                  prefixIcon: Icon(Icons.text_fields),
                ),
                const SizedBox(height: 10),
                const XInput(
                  label: "Description",
                  prefixIcon: Icon(Icons.text_fields),
                ),
                const SizedBox(height: 10),
                const XInput(
                  label: "Price",
                  prefixIcon: Icon(Icons.price_change),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  items: [
                    ...[
                      'Drink',
                      'Food',
                      'Medicines',
                    ].map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                  ],
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                    hintText: "select category",
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  onChanged: (value) {},
                ),
                TextButton(
                  onPressed: () {
                    showCreateCategory();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(Get.context!).primaryColor,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Text(
                    "Add New Category",
                    style: Theme.of(Get.context!).textTheme.bodyMedium,
                  ),
                ),
                //   status with swtcitch

                const SizedBox(height: 10),
                SwitchListTile.adaptive(
                  value: true,
                  visualDensity: VisualDensity.compact,
                  title: Text(
                    "Status",
                    style: Theme.of(Get.context!).textTheme.bodyMedium,
                  ),
                  activeColor: Theme.of(Get.context!).primaryColor,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                Text(
                  "Image",
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                const InputMedia(
                  type: TypeInputMedia.single,
                  canPreview: true,
                  maxMedia: 1,
                  source: SourceMedia.gallery,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCreateCategory() {
    Get.bottomSheet(Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text("Create Category"),
          const SizedBox(height: 10),
          const XInput(
            label: "Name",
            prefixIcon: Icon(Icons.text_fields),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Save"),
          ),
          const SizedBox(height: 10),
        ])));
  }
}
