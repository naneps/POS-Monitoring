import 'package:flutter/services.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_currency.dart';

class CurrencyFormatter extends TextInputFormatter {
  final CurrencyType currencyType;
  bool? withSymbol;
  CurrencyFormatter(this.currencyType, {this.withSymbol = false});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.isEmpty) {
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    // Remove all non-digit characters
    newText = newText.replaceAll(RegExp(r'\D'), '');

    // Apply currency symbol based on the currency type
    switch (currencyType) {
      case CurrencyType.idr:
        newText = _formatCurrency(newText, withSymbol: withSymbol);
        break;
      case CurrencyType.usd:
      case CurrencyType.eur:
      case CurrencyType.gbp:
      case CurrencyType.aud:
      case CurrencyType.cad:
      case CurrencyType.chf:
      case CurrencyType.jpy:
      case CurrencyType.cny:
      case CurrencyType.sgd:
      case CurrencyType.hkd:
        newText = _formatCurrency(newText, withSymbol: withSymbol);
        break;
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String formatValue(String value) {
    return _formatCurrency(value.replaceAll(RegExp(r'\D'), ''),
        withSymbol: withSymbol);
  }

  String _formatCurrency(String value, {bool? withSymbol = false}) {
    if (value.isEmpty) return '0';

    // Format the value with thousands separator
    int intValue = int.parse(value);
    String formattedValue = intValue.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');

    // Append currency symbol if withSymbol is true
    if (withSymbol == true) {
      switch (currencyType) {
        case CurrencyType.idr:
          formattedValue = 'Rp $formattedValue';
          break;
        case CurrencyType.usd:
          formattedValue = '\$ $formattedValue';
          break;
        case CurrencyType.eur:
          formattedValue = '€ $formattedValue';
          break;
        case CurrencyType.gbp:
          formattedValue = '£ $formattedValue';
          break;
        case CurrencyType.aud:
          formattedValue = 'A\$ $formattedValue';
          break;
        case CurrencyType.cad:
          formattedValue = 'C\$ $formattedValue';
          break;
        case CurrencyType.chf:
          formattedValue = 'CHF $formattedValue';
          break;
        case CurrencyType.jpy:
          formattedValue = '¥ $formattedValue';
          break;
        case CurrencyType.cny:
          formattedValue = '¥ $formattedValue';
          break;
        case CurrencyType.sgd:
          formattedValue = 'S\$ $formattedValue';
          break;
        case CurrencyType.hkd:
          formattedValue = 'HK\$ $formattedValue';
          break;
      }
    }

    return formattedValue;
  }
}
