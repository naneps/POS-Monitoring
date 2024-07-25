import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List<StockHistoryModel> dummyStockHistory = [
  StockHistoryModel(
    itemName: "Item 1",
    category: StockHistoryType.stockIn,
    quantity: "10",
    time: "10:00 AM",
    date: "2024-07-25",
    author: "Author 1",
  ),
  StockHistoryModel(
    itemName: "Item 2",
    category: StockHistoryType.stockOut,
    quantity: "5",
    time: "11:00 AM",
    date: "2024-07-25",
    author: "Author 2",
  ),
  StockHistoryModel(
    itemName: "Item 3",
    category: StockHistoryType.stockIn,
    quantity: "20",
    time: "12:00 PM",
    date: "2024-07-25",
    author: "Author 3",
  ),
  // Add more dummy data as needed
];

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
}

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
