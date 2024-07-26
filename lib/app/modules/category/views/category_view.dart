import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Management'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "create_category",
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: const Icon(Icons.add),
        onPressed: () {
          showCategoryForm();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.getCategories();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const XInput(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: controller.obx((state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return ListTile(
                        title: Text(category.name!),
                        onTap: () {
                          // controller.selectCategory(category);
                        },
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showCategoryForm(category: category);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteCategory(category.id!);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCategoryForm({CategoryModel? category}) {
    if (category != null) {
      controller.category.value = category;
    } else {
      controller.category.value = CategoryModel();
    }

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              XInput(
                label: "Name",
                initialValue: controller.category.value.name,
                prefixIcon: const Icon(Icons.text_fields),
                onSaved: (val) {
                  controller.category.value.name = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              XInput(
                label: "Code",
                initialValue: controller.category.value.code,
                prefixIcon: const Icon(Icons.code),
                onSaved: (val) {
                  controller.category.value.code = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          if (category != null) {
                            controller.updateCategory();
                          } else {
                            controller.createCategory();
                          }
                          Get.back();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
