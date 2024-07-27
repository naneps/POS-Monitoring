import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Define the StockHistoryType enum with extensions
enum StockHistoryType { stockIn, stockOut }

extension StockHistoryTypeExtension on StockHistoryType {
  Color get color {
    switch (this) {
      case StockHistoryType.stockIn:
        return Colors.green;
      case StockHistoryType.stockOut:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case StockHistoryType.stockIn:
        return MdiIcons.arrowDown;
      case StockHistoryType.stockOut:
        return MdiIcons.arrowUp;
    }
  }

  String get name {
    switch (this) {
      case StockHistoryType.stockIn:
        return 'Stock In';
      case StockHistoryType.stockOut:
        return 'Stock Out';
    }
  }

  String get symbol => toString().split('.').last;
  String get value => toString().split('.').last;
}

// Define the StockHistoryModel class
class StockHistoryModel {
  String? itemName;
  StockHistoryType? category;
  String? quantity;
  String? time;
  String? date;
  String? author;

  StockHistoryModel({
    this.itemName,
    this.category,
    this.quantity,
    this.time,
    this.date,
    this.author,
  });

  // Method to create an instance from JSON
  factory StockHistoryModel.fromJson(Map<String, dynamic> json) {
    return StockHistoryModel(
      itemName: json['barang'],
      category: _getCategoryFromString(json['keterangan']),
      quantity: json['qty']?.toString(),
      time: json['tanggal']?.split(' ')?.last,
      date: json['tanggal']?.substring(0, json['tanggal']?.lastIndexOf(' ')),
      author: json['nama_officer'],
    );
  }

  // Helper method to convert string to StockHistoryType
  static StockHistoryType? _getCategoryFromString(String? category) {
    switch (category) {
      case 'IN':
        return StockHistoryType.stockIn;
      case 'OUT':
        return StockHistoryType.stockOut;
      default:
        return StockHistoryType.stockOut;
    }
  }
}
