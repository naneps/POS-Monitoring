import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';
import 'package:mvvm_getx_pattern/app/commons/utils/input_currenrcy_formatter.dart';

class DashboardSummaryModel {
  int? totalOfficer;
  int? totalOwner;
  int? totalBarang;
  int? totalKategori;
  int? totalTransaksi;
  int? totalOutOfStock;
  int? totalTransaksiPaid;
  DashboardSummaryModel({
    this.totalOfficer = 0,
    this.totalOwner = 0,
    this.totalBarang = 0,
    this.totalKategori = 0,
    this.totalTransaksi = 0,
    this.totalOutOfStock = 0,
    this.totalTransaksiPaid = 0,
  });

  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) {
    return DashboardSummaryModel(
      totalOfficer: json['total_officer'],
      totalOwner: json['total_owner'],
      totalBarang: json['total_barang'],
      totalKategori: json['total_kategori'],
      totalTransaksi: json['total_transaksi'],
      totalOutOfStock: json['total_out_off_stock'],
      totalTransaksiPaid: json['total_transaksi_paid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_officer': totalOfficer,
      'total_owner': totalOwner,
      'total_barang': totalBarang,
      'total_kategori': totalKategori,
      'total_transaksi': totalTransaksi,
      'total_out_off_stock': totalOutOfStock,
    };
  }

  String get totalTransaksiPaidFormatted {
    return CurrencyFormatter(CurrencyType.idr, withSymbol: true).formatValue(
      totalTransaksiPaid.toString(),
    );
  }
}
