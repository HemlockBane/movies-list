import 'package:intl/intl.dart';

class FormatService{
  static String formatDateOnly(DateTime date, {bool dayFirst = false}) {
    if (date == null) return "";
    return dayFirst
      ? DateFormat('dd MMMM, yyyy').format(date)
      : DateFormat('yMMMMd').format(date);
  }
}