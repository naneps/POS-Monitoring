import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';
import 'package:mvvm_getx_pattern/app/services/api.service.dart';

class CategoryModel {
  int? id;
  String? name;
  String? code;
  CategoryModel({
    this.id,
    this.name,
    this.code,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id_kategori_barang'],
        name: json['nama'],
        code: json['code'],
      );
  toCreateCategory() {
    return {
      "id_kategori_barang": id,
    };
  }

  toFormatCategory() {
    return {
      "id": id,
      "nama": name,
      "code": code,
    };
  }
}

class ItemModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stock;
  String? code;
  String? image;
  CategoryModel? category;
  ItemModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.image,
    this.category,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id_barang'],
        name: json['nama'],
        description: json['description'],
        price: json['amount'],
        stock: json['qty'],
        // image: json['image'],
        category: json['kategori_id'] != null
            ? CategoryModel.fromJson(json['kategori_id'])
            : null,
      );

  String get formattedPrice {
    return CurrencyFormatter(
      CurrencyType.idr,
      withSymbol: true,
    ).formatValue(price.toString());
  }

  toCreateItem() {
    return {
      "nama": name,
      "qty": stock,
      "amount": price,
      "code": code,
      "kategori_id": category!.toCreateCategory()
    };
  }

  Map<String, dynamic> toStockIn() {
    return {"id_barang": id, "qty": stock, "id_user": ApiService().uId};
  }

  @override
  String toString() => 'ItemModel(id: $id)';

  toUpdateItem() {
    return {
      "id": id,
      "nama": name,
      "qty": stock,
      "amount": price,
      "code": code,
      "kategori_id": category?.toCreateCategory()
    };
  }
}
