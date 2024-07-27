import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mvvm_getx_pattern/app/models/item_model.dart';

class CartItemModel {
  int? id;
  RxInt? qty;
  ItemModel? item;

  CartItemModel({this.id, this.qty, this.item});

  toCreate() {
    return {
      "id_barang": item?.id.toString(),
      "qty": qty!.value,
    };
  }
}
