import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class ItemProvider extends BaseProvider {
  Future<Response> createItem(Map<String, dynamic> data) async {
    return await post('/master/barang/create', data);
  }

  Future<Response> deleteItem(String id) async {
    return await delete('/master/barang/$id/delete');
  }

  Future<Response> getItem(String id) async {
    return await post('/master/barang/$id/detail', {'id': id});
  }

  Future<Response> getItems() async {
    return await post('/master/barang/all', {});
  }

  Future<Response> updateItem(Map<String, dynamic> data, String id) async {
    return await post('/master/barang/$id/update', data);
  }

  Future<Response> updateStockIn(Map<String, dynamic> data, String id) async {
    return await post('/master/barang/$id/in', data);
  }
}
