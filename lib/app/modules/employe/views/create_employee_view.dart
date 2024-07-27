import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/enums/role.enum.dart';
import 'package:mvvm_getx_pattern/app/modules/employe/controllers/create_employee_controller.dart';

class CreateEmployeeView extends GetView<CreateEmployeeController> {
  const CreateEmployeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "create_employee",
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Employee'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close),
            )
          ],
          forceMaterialTransparency: true,
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width, 50),
            ),
            onPressed: () {
              controller.createUser();
            },
            child: const Text("Save"),
          ),
        ),
        body: Obx(() {
          return Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                XInput(
                    label: "Name",
                    prefixIcon: const Icon(Icons.text_fields),
                    onSaved: (value) {
                      controller.user.value.name = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    }),
                //   const SizedBox(height: 10),
                //   const XInput(
                //     label: "Email",
                //     prefixIcon: Icon(Icons.email),
                //   ),
                const SizedBox(height: 10),
                XInput(
                    label: "Phone",
                    prefixIcon: const Icon(Icons.phone),
                    onSaved: (value) {
                      controller.user.value.phone = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone is required";
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Role",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          ...Role.values.map((e) => Expanded(
                                child: RadioListTile<Role>(
                                  value: e,
                                  groupValue: controller.user.value.roleName,
                                  onChanged: (value) {
                                    controller.user.value.roleName = value!;
                                    controller.user.refresh();
                                  },
                                  title: Text(e.name),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                XInput(
                  label: "Password",
                  prefixIcon: const Icon(Icons.password),
                  onSaved: (value) {
                    controller.user.value.password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
