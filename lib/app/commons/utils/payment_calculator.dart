import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';

class PaymentCalculator {
  CartModel cart = CartModel.defaultCart;
  PaymentCalculator({required this.cart});
  void calculateSubtotal() {
    int subtotal = 0;
    for (CartItemModel item in cart.items!) {
      subtotal += item.qty!.value * item.item!.price!;
    }
    cart.subtotal!.value = subtotal;
  }
}
