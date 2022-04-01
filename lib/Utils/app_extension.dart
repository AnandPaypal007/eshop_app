import 'dart:ui';

import 'package:intl/intl.dart';

extension StringExt on String {
  toDate({String formate = "dd-MMM-yy"}) {
    DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat(formate);
    final String formatted = formatter.format(date);
    return formatted;
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}