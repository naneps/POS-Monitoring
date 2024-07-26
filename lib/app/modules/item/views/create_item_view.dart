import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/modules/item/controllers/create_item_controller.dart';

class CreateItemView extends GetView<CreateItemController> {
  const CreateItemView({super.key});

  @override
  get controller => Get.put(CreateItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.isEdit.value ? "Edit Item" : "Create Item",
        ),
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
              XInput(
                label: "Name",
                prefixIcon: const Icon(Icons.text_fields),
                initialValue: controller.item.value.name,
                onSaved: (val) {
                  controller.item.value.name = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              // const SizedBox(height: 10),
              // const XInput(
              //   label: "Description",
              //   prefixIcon: Icon(Icons.text_fields),
              // ),
              // code
              //   XInput(
              //     label: "Code",
              //     initialValue: controller.item.value.code,
              //     prefixIcon: const Icon(Icons.qr_code),
              //     onSaved: (val) {
              //       controller.item.value.code = val!;
              //     },
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter your code';
              //       }
              //       return null;
              //     },
              //   ),
              //   const SizedBox(height: 10),
              InputCurrency(
                  label: "Price",
                  initialValue: controller.item.value.price.toString(),
                  currencyType: CurrencyType.idr,
                  onChanged: (val) {
                    controller.item.value.price = int.parse(val);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your price';
                    }
                    return null;
                  }),
              const SizedBox(height: 10),
              XInput(
                label: "Quantity Stock",
                initialValue: (controller.item.value.stock ?? 0).toString(),
                prefixIcon: const Icon(Icons.inventory_2_sharp),
                keyboardType: TextInputType.number,
                onSaved: (val) {
                  controller.item.value.stock = int.parse(val!);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your quantity stock';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Obx(() {
                // Ensure the current category exists in the categories list
                final categories = controller.categories;
                final currentCategory = controller.item.value.category;

                // If the current category is not in the list, add it temporarily for display
                if (currentCategory != null &&
                    !categories.contains(currentCategory)) {
                  categories.insert(0, currentCategory);
                }

                return DropdownButtonFormField<CategoryModel>(
                  hint: Text(currentCategory == null
                      ? "Select category"
                      : currentCategory.name!),
                  value: currentCategory,
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name!),
                    );
                  }).toList(),
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                    hintText: "Select category",
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  onChanged: (value) {
                    controller.item.value.category = value;
                    print(value!.id);
                    print(controller.item.value.category!.id);
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                );
              }),

              //   TextButton(
              //     onPressed: () {
              //       showCreateCategory();
              //     },
              //     style: TextButton.styleFrom(
              //       foregroundColor: Theme.of(Get.context!).primaryColor,
              //       padding: const EdgeInsets.all(0),
              //     ),
              //     child: Text(
              //       "Add New Category",
              //       style: Theme.of(Get.context!).textTheme.bodyMedium,
              //     ),
              //   ),
              //   status with swtcitch

              // const SizedBox(height: 10),
              // SwitchListTile.adaptive(
              //   value: true,
              //   visualDensity: VisualDensity.compact,
              //   title: Text(
              //     "Status",
              //     style: Theme.of(Get.context!).textTheme.bodyMedium,
              //   ),
              //   activeColor: Theme.of(Get.context!).primaryColor,
              //   onChanged: (value) {},
              // ),
              //   const SizedBox(height: 10),
              //   Text(
              //     "Image",
              //     style: Theme.of(Get.context!).textTheme.bodyMedium,
              //   ),
              const SizedBox(height: 10),
              //   const InputMedia(
              //     type: TypeInputMedia.single,
              //     canPreview: true,
              //     maxMedia: 1,
              //     source: SourceMedia.gallery,
              //   ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.saveItem();
                },
                child: const Text("Save"),
              ),
              const SizedBox(height: 10),
            ],
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
