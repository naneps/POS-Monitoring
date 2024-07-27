import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/providers/transaction.provider.dart';

class TransactionRepository {
  final transactionProvider = Get.find<TransactionProvider>();
  Future<void> createTransaction(Map<String, dynamic> data) async {
    final res = await transactionProvider.createTransaction(data);
    print(res.body);
    if (res.statusCode == 201) {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.success,
      );
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: res.body['message'],
        type: SnackBarType.error,
      );
    }
  }
}
