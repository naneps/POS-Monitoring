import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/user.provider.dart';
import 'package:mvvm_getx_pattern/app/modules/employe/controllers/create_employee_controller.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

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
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => UserRepository());
  }
}
