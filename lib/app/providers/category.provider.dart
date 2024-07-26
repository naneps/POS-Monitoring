import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class CategoryProvider extends BaseProvider {
  Future<Response> createCategory(Map<String, dynamic> data) async {
    return await post('/master/kategori/create', data);
  }

  Future<Response> deleteCategory(String id) async {
    return await delete('/master/kategori/$id/delete');
  }

  Future<Response> getCategories() async {
    return await post('/master/kategori/all', {});
  }

  Future<Response> getCategory(String id) async {
    return await post('/master/kategori$id/detail', {'id': id});
  }

  Future<Response> updateCategory(Map<String, dynamic> data, String id) async {
    return await post('/master/kategori/$id/update', data);
  }
}
