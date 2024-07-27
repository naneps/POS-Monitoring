import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/dashboard/controllers/list_transaction.dart';
import 'package:mvvm_getx_pattern/app/modules/transaction/views/list_item.dart';

class AllTransactionView extends GetView<ListTransactionController> {
  const AllTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Transaction'),
        centerTitle: true,
      ),
      body: Container(
        child: const Column(
          children: [Expanded(child: ListItem())],
        ),
      ),
    );
  }
}
