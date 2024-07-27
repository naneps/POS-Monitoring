import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/employe/bindings/employe_binding.dart';
import 'package:mvvm_getx_pattern/app/modules/employe/views/create_employee_view.dart';

import '../controllers/employe_controller.dart';

class EmployeeView extends GetView<EmployeController> {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "create_employee",
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Get.to(
            const CreateEmployeeView(),
            binding: EmployeBinding(),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            key: const Key('search-bar'),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: controller.obx((context) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: controller.users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return ListTile(
                    title: Text(user.name!),
                    subtitle:
                        Text("${user.roleName!.name} | ${user.phone ?? ""}"),
                    leading: const Icon(Icons.person),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
