import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/routes/app_pages.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  const CoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(() {
                return ListTile(
                  leading: CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: "",
                    ),
                  ),
                  dense: true,
                  title: Text(
                    controller.user.value.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(controller.user.value.roleName!.name ?? ''),
                  onTap: () {},
                );
              }),
              ...controller.navigation.map(
                (e) => Obx(() {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      visualDensity: VisualDensity.compact,
                      leading: Icon(e.icon),
                      dense: true,
                      selectedTileColor: Theme.of(context).primaryColor,
                      selected: controller.currentIndex.value ==
                          controller.navigation.indexOf(e),
                      selectedColor: Theme.of(context).colorScheme.onPrimary,
                      title: Text(e.title!),
                      onTap: () {
                        controller.currentIndex.value =
                            controller.navigation.indexOf(e);
                        Get.back();
                      },
                    ),
                  );
                }),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  MdiIcons.logoutVariant,
                  color: Colors.red,
                ),
                title: const Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  Get.offAllNamed(Routes.AUTH);
                  GetStorage().remove("token");
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(
              Routes.TRANSACTION,
            );
          },
          shape: const CircleBorder(),
          child: Icon(
            MdiIcons.cashRegister,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          items: controller.navigation
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  activeIcon: Icon(e.activeIcon),
                  label: e.title,
                ),
              )
              .toList(),
        ),
        appBar: AppBar(
          title:
              Text(controller.navigation[controller.currentIndex.value].title!),
          elevation: 0,
          forceMaterialTransparency: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: controller.navigation[controller.currentIndex.value].page),
      );
    });
  }
}
