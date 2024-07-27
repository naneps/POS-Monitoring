import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';

class TransactionModel {
  int? idTransaksi;
  String? namaUser;
  String? nomorTeleponUser;
  List<TransactionDetail>? details;
  int? totalAmount;
  int? inAmount;
  int? returnAmount;
  String? statusTransaksi;
  String? tanggalTransaksi;
  String? shift;

  TransactionModel({
    this.idTransaksi,
    this.namaUser,
    this.nomorTeleponUser,
    this.details,
    this.totalAmount,
    this.statusTransaksi,
    this.tanggalTransaksi,
    this.inAmount,
    this.shift,
    this.returnAmount,
  });

  // Method to create an instance from JSON
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      idTransaksi: json['id_transaksi'],
      namaUser: json['nama_user'],
      nomorTeleponUser: json['nomor_telepon_user'],
      details: (json['details'] as List<dynamic>?)
          ?.map((item) => TransactionDetail.fromJson(item))
          .toList(),
      totalAmount: json['total_amount'],
      inAmount: json['in_amount'] ?? 0,
      returnAmount: json['return_amount'] ?? 0,
      statusTransaksi: json['status_transaksi'],
      tanggalTransaksi: json['tanggal_transaksi'],
      shift: json['nama_shift'],
    );
  }

  // Getter to format totalAmount without decimal places
  String get formattedTotalAmount {
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      totalAmount.toString(),
    );
  }

  String get formattedInAmount {
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      inAmount.toString(),
    );
  }

  String get formattedReturnAmount {
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      returnAmount.toString(),
    );
  }
}

class TransactionDetail {
  int? idBarang;
  String? nama;
  int? qty;
  int? amount;

  TransactionDetail({
    this.idBarang,
    this.nama,
    this.qty,
    this.amount,
  });

  // Method to create an instance from JSON
  factory TransactionDetail.fromJson(Map<String, dynamic> json) {
    return TransactionDetail(
      idBarang: json['id_barang'],
      nama: json['nama'],
      qty: json['qty'],
      amount: json['amount'],
    );
  }

  // Getter to format amount without decimal places
  String get formattedAmount {
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      amount.toString(),
    );
  }

  String get formatTotalAmount {
    int totalAmount = 0;
    if (amount == null || qty == null) return '';
    totalAmount = amount! * qty!;
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      totalAmount.toString(),
    );
  }
}
