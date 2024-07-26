import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';
import 'package:mvvm_getx_pattern/app/models/cart_item.model.dart';

class CartModel {
  static CartModel get defaultCart => CartModel(
        id: null,
        customerName: '',
        subtotal: 0.obs,
        grandTotal: 0.obs,
        discount: 0.obs,
        tax: 0.obs,
        charge: 0.obs,
        change: 0.obs,
        items: <CartItemModel>[].obs,
      );
  static CartModel get empty => CartModel();
  int? id;
  String? customerName;
  RxInt? subtotal;
  RxInt? grandTotal;
  RxInt? discount;
  RxInt? tax;
  RxInt? charge;

  RxInt? change;

  RxList<CartItemModel>? items = <CartItemModel>[].obs;
  CartModel({
    this.id,
    this.customerName,
    this.subtotal,
    this.grandTotal,
    this.discount,
    this.tax,
    this.charge,
    this.change,
    this.items,
  });
  String get changeFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(change!.value.toString());
  String get chargeFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(charge!.value.toString());

  String get discountFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(discount!.value.toString());

  String get grandTotalFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(grandTotal!.value.toString());

  String get subtotalFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(subtotal!.value.toString());

  String get taxFormatted => CurrencyFormatter(
        CurrencyType.idr,
        withSymbol: true,
      ).formatValue(tax!.value.toString());
  @override
  String toString() => 'CartModel(id: $id)';
}
