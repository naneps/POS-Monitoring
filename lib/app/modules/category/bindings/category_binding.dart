import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/category.provider.dart';
import 'package:mvvm_getx_pattern/app/repositories/category.repository.dart';

import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut(() => CategoryProvider());
    Get.lazyPut(() => CategoryRepository());
  }
}
