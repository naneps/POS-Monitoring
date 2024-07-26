import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/payment_calculator.dart';
import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';
import 'package:mvvm_getx_pattern/app/repositories/item.repository.dart';

class TransactionController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[].obs;
  final itemRepoSitory = Get.find<ItemRepository>();
  Rx<CartModel> cart = CartModel.defaultCart.obs;
  PaymentCalculator paymentCalculator =
      PaymentCalculator(cart: CartModel.defaultCart);
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

  void checkout() {}

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

  @override
  void onInit() {
    super.onInit();
    paymentCalculator.cart = cart.value;
    getItems();
  }

  void removeItemFromCart(CartItemModel cartItem) {
    cart.value.items!.remove(cartItem);
    paymentCalculator.calculateSubtotal();
  }
}
