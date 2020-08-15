import 'package:intl/intl.dart';

//Turn price into Rupiah currency in String
String priceFormatter(int price) {
  var numberFormat =
      NumberFormat.simpleCurrency(locale: 'in', decimalDigits: 0);
  String priceString = numberFormat.format(price);
  return priceString;
}
