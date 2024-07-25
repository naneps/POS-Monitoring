import 'package:get/get.dart';

import 'package:mvvm_getx_pattern/app/modules/employe/controllers/create_employee_controller.dart';

import '../controllers/employe_controller.dart';

class EmployeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEmployeeController>(
      () => CreateEmployeeController(),
    );
    Get.lazyPut<EmployeController>(
      () => EmployeController(),
    );
  }
}
