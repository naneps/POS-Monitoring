import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/models/navigation.model.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';

class ManagementController extends GetxController {
  RxList<NavigationModel> navigations = <NavigationModel>[
    NavigationModel(
      title: 'Item Management',
      route: Routes.ITEM,
      icon: MdiIcons.clipboardText,
      activeIcon: MdiIcons.clipboardTextOutline,
    ),
    // category management
    NavigationModel(
      title: 'Category Management',
      route: Routes.CATEGORY,
      icon: MdiIcons.label,
      activeIcon: MdiIcons.labelOutline,
    ),
    NavigationModel(
      title: 'Employee Management',
      route: Routes.EMPLOYE,
      icon: MdiIcons.accountGroup,
      activeIcon: MdiIcons.accountGroupOutline,
    ),
    // NavigationModel(
    //   title: 'Category Management',
    //   route: '/management-kategori',
    //   icon: MdiIcons.label,
    //   activeIcon: MdiIcons.labelOutline,
    // ),
    NavigationModel(
      title: 'Stock Management',
      route: Routes.STOCK,
      icon: MdiIcons.warehouse,
      activeIcon: MdiIcons.warehouse,
    ),
  ].obs;
}
