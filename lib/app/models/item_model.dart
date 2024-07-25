import 'dart:math';

import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';

void main() {
  final categories = generateDummyCategories();
  final randomDummyItems = generateRandomDummyItems(15, categories);
  final realNameDummyItems = generateRealNameDummyItems(categories);

  final allItems = randomDummyItems + realNameDummyItems;

  for (var item in allItems) {
    print(
        'ID: ${item.id}, Name: ${item.name}, Description: ${item.description}, Price: ${item.price}, Stock: ${item.stock}, Image: ${item.image}, Category: ${item.category?.name}');
  }
}

// Function to generate dummy categories
List<CategoryModel> generateDummyCategories() {
  return [
    CategoryModel(id: 1, name: 'Electronics'),
    CategoryModel(id: 2, name: 'Clothing'),
    CategoryModel(id: 3, name: 'Home & Kitchen'),
    CategoryModel(id: 4, name: 'Beauty & Personal Care'),
    CategoryModel(id: 5, name: 'Sports & Outdoors'),
  ];
}

// Function to generate dummy items with random data
List<ItemModel> generateRandomDummyItems(
    int count, List<CategoryModel> categories) {
  final random = Random();
  List<ItemModel> items = [];

  for (int i = 0; i < count; i++) {
    final category = categories[random.nextInt(categories.length)];
    items.add(ItemModel(
      id: i + 1,
      name: 'Random Item ${i + 1}',
      description: 'Description of random item ${i + 1}',
      price: random.nextInt(1000) + 100, // price between 100 and 1100
      stock: random.nextInt(100) + 1, // stock between 1 and 100
      image: 'https://via.placeholder.com/150',
      category: category,
    ));
  }

  return items;
}

// Function to generate dummy items with real names
List<ItemModel> generateRealNameDummyItems(List<CategoryModel> categories) {
  final random = Random();
  final realNames = [
    'Apple iPhone 13',
    'Samsung Galaxy S21',
    'Sony WH-1000XM4',
    'Nike Air Max 270',
    'Adidas Ultraboost',
    'Dyson V11 Vacuum',
    'Instant Pot Duo',
    'Le Creuset Dutch Oven',
    'L’Oreal Paris Shampoo',
    'Neutrogena Face Wash',
    'Under Armour T-shirt',
    'Patagonia Fleece Jacket',
    'Fitbit Charge 4',
    'GoPro HERO9',
    'Canon EOS R5',
  ];

  List<ItemModel> items = [];

  for (int i = 0; i < realNames.length; i++) {
    final category = categories[random.nextInt(categories.length)];
    items.add(ItemModel(
      id: i + 1,
      name: realNames[i],
      description: 'Description of ${realNames[i]}',
      price: random.nextInt(100000) + 100, // price between 100 and 1100
      stock: random.nextInt(100) + 1, // stock between 1 and 100
      image: 'https://via.placeholder.com/150',
      category: category,
    ));
  }

  return items;
}

// Define CategoryModel and ItemModel
class CategoryModel {
  int? id;
  String? name;
  CategoryModel({
    this.id,
    this.name,
  });
}

class ItemModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stock;
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
  String get formattedPrice {
    return CurrencyFormatter(
      CurrencyType.idr,
      withSymbol: true,
    ).formatValue(price.toString());
  }
}
