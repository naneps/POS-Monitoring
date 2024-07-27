import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/overlays/x_snack_bar.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/payment_calculator.dart';
import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';
import 'package:mvvm_getx_pattern/app/repositories/transaction_repository.dart';

class TransactionController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[].obs;
  final itemRepoSitory = Get.find<ItemRepository>();
  Rx<CartModel> cart = CartModel.defaultCart.obs;
  PaymentCalculator paymentCalculator =
      PaymentCalculator(cart: CartModel.defaultCart);
  final transactionRepo = Get.find<TransactionRepository>();
  void addItemToCart(CartItemModel cartItem) {
    final existingItem = cart.value.items!.firstWhere(
        (element) => element.item?.id == cartItem.item?.id,
        orElse: () => CartItemModel());
    if (existingItem.item?.id != null) {
      existingItem.qty!.value++;
    } else {
      cart.value.items!.add(cartItem);
    }

    paymentCalculator.calculateSubtotal();
  }

  void calculateChange() {
    paymentCalculator.calculateChange();
  }

  void checkout() async {
    if (isCartValid()) {
      await transactionRepo.createTransaction(cart.value.toCreate());
      print(cart.value.toCreate());
    } else {
      XSnackBar.show(
        context: Get.context!,
        message: 'Cart is not valid , please add item to cart',
        type: SnackBarType.error,
      );
    }
  }

  void getItems() async {
    try {
      final res = await itemRepoSitory.getItems();
      if (res.isEmpty) {
        items.value = [];
      } else {
        items.value = res;
      }
    } catch (e) {
      print(e);
    }
  }

  bool isCartValid() {
    final isCartEmpty = cart.value.items!.isEmpty;
    final hasZeroSubtotal = cart.value.subtotal!.value == 0;
    final chargeIsLessThanGrandTotal =
        cart.value.charge!.value < cart.value.grandTotal!.value;

    return !(isCartEmpty || (hasZeroSubtotal && chargeIsLessThanGrandTotal));
  }

  @override
  void onInit() {
    super.onInit();
    paymentCalculator.cart = cart.value;
    getItems();
    ever(cart.value.items!, (callback) {
      for (CartItemModel item in cart.value.items!) {
        ever(item.qty!, (callback) {
          paymentCalculator.calculateSubtotal();
        });
      }
    });
  }

  void removeItemFromCart(CartItemModel cartItem) {
    cart.value.items!.remove(cartItem);
    paymentCalculator.calculateSubtotal();
  }
}
