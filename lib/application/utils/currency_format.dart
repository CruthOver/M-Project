import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(String? number) {
    if (number != null) {
      number = number.replaceAll(",", "");
    }
    int value = int.tryParse(number ?? "0") ?? 0;
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(value);
  }
}
