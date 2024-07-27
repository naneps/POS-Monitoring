import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/dashboard.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/dashboard.repository.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut(() => DashboardRepository());
    Get.lazyPut(() => DashboardProvider());
  }
}
