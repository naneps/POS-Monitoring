import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/models/transaction_model.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/summary_transaction_view.dart';
import 'package:mvvm_getx_pattern/app/providers/transaction.provider.dart';

class TransactionRepository {
  final transactionProvider = Get.find<TransactionProvider>();
  List<TransactionModel> transactions = [];
  final TransactionModel transaction = TransactionModel();
  Future<bool> createTransaction(Map<String, dynamic> data) async {
    final res = await transactionProvider.createTransaction(data);
    print(res.body);
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.success,
      );
      print("masuk");
      print(res.body);
      print(res.body['id_transaksi']);
      // ignore: use_build_context_synchronously
      Get.to(
        () => const SummaryTransactionView(),
        arguments: res.body['id_transaksi'],
      );
      return true;
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.error,
      );
      return false;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    final res = await transactionProvider.getTransactions();
    if (res.body['data'] != null) {
      final data = res.body['data'] as List;
      transactions = data.map((e) => TransactionModel.fromJson(e)).toList();
    } else {
      transactions = [];
    }
    return transactions;
  }

  Future<TransactionModel> getTransaction(String id) async {
    print(id);
    final res = await transactionProvider.getTransaction(id);
    if (res.body['data'] != null) {
      return TransactionModel.fromJson(res.body['data']);
    } else {
      return TransactionModel();
    }
  }
}
