import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/dashboard.model.dart';
import 'package:mvvm_getx_pattern/app/providers/dashboard.provider.dart';

class DashboardRepository {
  final dashboardProvider = Get.find<DashboardProvider>();

  DashboardSummaryModel dashboardSummary = DashboardSummaryModel();

  Future<DashboardSummaryModel> getDashboardSummary() async {
    final res = await dashboardProvider.getDashboard();
    if (res.statusCode == 201) {
      return DashboardSummaryModel.fromJson(res.body['data']);
    } else {
      return DashboardSummaryModel();
    }
  }
}
