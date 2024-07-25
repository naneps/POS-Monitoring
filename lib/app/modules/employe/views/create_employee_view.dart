import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/enums/role.enum.dart';

class CreateEmployeeView extends GetView<CreateEmployeeView> {
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
            onPressed: () {},
            child: const Text("Save"),
          ),
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const XInput(
                label: "Name",
                prefixIcon: Icon(Icons.text_fields),
              ),
              const SizedBox(height: 10),
              const XInput(
                label: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 10),
              const XInput(
                label: "Phone",
                prefixIcon: Icon(Icons.phone),
              ),
              const SizedBox(height: 10),
              Text(
                "Role",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  ...Role.values.map((e) => Expanded(
                        child: RadioListTile(
                          value: e,
                          groupValue: Role.admin,
                          onChanged: (value) {},
                          title: Text(e.name),
                        ),
                      ))
                ],
              ),
              const XInput(
                label: "Password",
                prefixIcon: Icon(Icons.password),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
