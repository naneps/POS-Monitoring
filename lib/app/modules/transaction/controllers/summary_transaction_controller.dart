import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';
import 'package:mvvm_getx_pattern/app/models/transaction_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/transaction_repository.dart';

class SummaryTransactionController extends GetxController {
  CartModel cart = CartModel.defaultCart;
  final transactionRepo = Get.find<TransactionRepository>();
  Rx<TransactionModel> transaction = TransactionModel().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTransaction();
  }

  void getTransaction() async {
    transaction.value = await transactionRepo.getTransaction(
      Get.arguments.toString(),
    );
  }
}
