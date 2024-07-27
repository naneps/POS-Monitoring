import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/dashboard.model.dart';
import 'package:mvvm_getx_pattern/app/repositories/dashboard.repository.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  Rx<DashboardSummaryModel> dashboardSummary = DashboardSummaryModel().obs;
  final dashboardRepository = Get.find<DashboardRepository>();

  void loadDummyData() {}

  @override
  void onInit() {
    super.onInit();
    getDashboardSummary();
  }

  void getDashboardSummary() async {
    dashboardSummary.value = await dashboardRepository.getDashboardSummary();
  }
}
