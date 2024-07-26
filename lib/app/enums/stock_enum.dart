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

  static StockItemStatus fromQuantity(int itemQuantity) {
    if (itemQuantity >= 10) {
      return StockItemStatus.ready;
    } else if (itemQuantity <= 8) {
      return StockItemStatus.lowStock;
    } else {
      return StockItemStatus.outOfStock;
    }
  }
}
