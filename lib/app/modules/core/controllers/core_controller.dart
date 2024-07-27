import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/models/navigation.model.dart';
import 'package:mvvm_getx_pattern/app/models/user_model.dart';
import 'package:mvvm_getx_pattern/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mvvm_getx_pattern/app/modules/dashboard/views/dashboard_view.dart';
import 'package:mvvm_getx_pattern/app/modules/management/views/management_view.dart';
import 'package:mvvm_getx_pattern/app/modules/profile/views/profile_view.dart';
import 'package:mvvm_getx_pattern/app/modules/stock/views/history_stock_view.dart';
import 'package:mvvm_getx_pattern/app/repositories/user_repository.dart';

class CoreController extends GetxController {
  final userRepo = Get.find<UserRepository>();
  Rx<UserModel> user = UserModel().obs;
  RxInt currentIndex = 0.obs;
  List<NavigationModel> navigation = [
    NavigationModel(
      title: 'Dashboard',
      route: '/dashboard',
      icon: MdiIcons.viewDashboardOutline,
      activeIcon: MdiIcons.viewDashboard,
      page: const DashboardView(),
    ),
    NavigationModel(
      title: 'Management',
      route: '/management',
      icon: MdiIcons.clipboardListOutline,
      activeIcon: MdiIcons.clipboardList,
      page: const ManagementView(),
    ),
    NavigationModel(
      title: 'History Stock',
      route: '/history-stock',
      icon: MdiIcons.history,
      activeIcon: MdiIcons.history,
      page: const HistoryStockView(),
    ),
    NavigationModel(
      title: 'Profile',
      route: '/profile',
      icon: MdiIcons.accountOutline,
      activeIcon: MdiIcons.account,
      page: const ProfileView(),
    ),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(currentIndex, (_) {
      Get.find<DashboardController>().getDashboardSummary();
    });
    getUser();
  }

  void getUser() async {
    try {
      user.value = await userRepo.getUser();
    } catch (e) {
      print(e);
    }
  }
}
