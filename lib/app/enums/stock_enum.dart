import 'package:flutter/material.dart';

enum StockItemStatus {
  ready,
  notReady,
  outOfStock,
  lowStock,
}

extension StockItemStatusExtension on StockItemStatus {
  Color get color {
    switch (this) {
      case StockItemStatus.ready:
        return Colors.green;
      case StockItemStatus.outOfStock:
        return Colors.red;
      case StockItemStatus.lowStock:
        return Colors.orange;
      case StockItemStatus.notReady:
        return Colors.grey;
    }
  }

  String get name {
    switch (this) {
      case StockItemStatus.ready:
        return 'Ready';
      case StockItemStatus.notReady:
        return 'Not Ready';
      case StockItemStatus.outOfStock:
        return 'Out of Stock';
      case StockItemStatus.lowStock:
        return 'Low Stock';
    }
  }

  int get requirement {
    switch (this) {
      case StockItemStatus.ready:
        return 10; // Standar jumlah untuk status ready
      case StockItemStatus.notReady:
        return 0; // Standar jumlah untuk status not ready
      case StockItemStatus.outOfStock:
        return 0; // Standar jumlah untuk status out of stock
      case StockItemStatus.lowStock:
        return 5; // Standar jumlah untuk status low stock
    }
  }

  Color get textColor {
    switch (this) {
      case StockItemStatus.ready:
        return Colors.white;
      case StockItemStatus.notReady:
        return Colors.white;
      case StockItemStatus.outOfStock:
        return Colors.white;
      case StockItemStatus.lowStock:
        return Colors.black;
    }
  }

  static StockItemStatus fromQuantity(int quantity) {
    if (quantity > 10) {
      return StockItemStatus.ready;
    } else if (quantity < 5) {
      return StockItemStatus.lowStock;
    } else {
      return StockItemStatus.outOfStock;
    }
  }
}
