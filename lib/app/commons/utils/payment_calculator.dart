import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';

class PaymentCalculator {
  CartModel cart = CartModel.defaultCart;
  PaymentCalculator({required this.cart});
  void calculateChange() {
    final change =
        (cart.charge!.value - cart.subtotal!.value).clamp(0, double.infinity);
    cart.change!.value = change.toInt();
  }

  void calculateCharge() {
    int charge = 0;
    cart.charge!.value = charge;
  }

  void calculateSubtotal() {
    int subtotal = 0;
    for (CartItemModel item in cart.items!) {
      subtotal += item.qty!.value * item.item!.price!;
    }
    cart.subtotal!.value = subtotal;
    cart.grandTotal!.value = cart.subtotal!.value;
    calculateChange();
  }
}
