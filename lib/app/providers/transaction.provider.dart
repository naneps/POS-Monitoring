import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mvvm_getx_pattern/app/providers/base_provider.dart';

class TransactionProvider extends BaseProvider {
  Future<Response> createTransaction(Map<String, dynamic> data) async {
    return await post('/transaksi/checkout', data);
  }

  Future<Response> deleteTransaction(String id) async {
    return await delete('/transaksi/$id/delete');
  }

  Future<Response> getTransaction(String id) async {
    return await post('/transaksi/$id/detail', {'id': id});
  }

  Future<Response> getTransactions() async {
    return await post('/transaksi/all', {});
  }

  Future<Response> updateTransaction(
      Map<String, dynamic> data, String id) async {
    return await post('/transaksi/$id/update', data);
  }
}
