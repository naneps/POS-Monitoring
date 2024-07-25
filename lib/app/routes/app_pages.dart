import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/core/bindings/core_binding.dart';
import '../modules/core/views/core_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/employe/bindings/employe_binding.dart';
import '../modules/employe/views/employe_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/item/bindings/item_binding.dart';
import '../modules/item/views/item_view.dart';
import '../modules/management/bindings/management_binding.dart';
import '../modules/management/views/management_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/stock/bindings/stock_binding.dart';
import '../modules/stock/views/stock_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.CORE,
        page: () => const CoreView(),
        binding: CoreBinding(),
        bindings: [
          DashboardBinding(),
          ProfileBinding(),
          StockBinding(),
          TransactionBinding(),
          ManagementBinding(),
          ItemBinding(),
        ]),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.STOCK,
      page: () => const StockView(),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: _Paths.MANAGEMENT,
      page: () => const ManagementView(),
      binding: ManagementBinding(),
    ),
    GetPage(
      name: _Paths.ITEM,
      page: () => const ItemView(),
      binding: ItemBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE,
      page: () => const EmployeeView(),
      binding: EmployeBinding(),
    ),
  ];

  AppPages._();
}
