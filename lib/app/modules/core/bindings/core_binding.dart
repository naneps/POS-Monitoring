import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/dashboard.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/dashboard.repository.dart';

import '../controllers/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(),
    );
    Get.lazyPut(() => DashboardRepository());
    Get.lazyPut(() => DashboardProvider());
  }
}
