import 'package:intl/intl.dart';

extension StringExt on String {
  toDate({String formate = "dd-MMM-yy"}) {
    DateTime date = DateTime.parse(this);
    final DateFormat formatter = DateFormat(formate);
    final String formatted = formatter.format(date);
    return formatted;
  }
}
