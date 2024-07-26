import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/models/cart_model.dart';

class CartController extends GetxController {
  Rx<CartModel> cart = CartModel.defaultCart.obs;
}
