import 'package:intl/intl.dart';
class TimeUtils {

  static DateTime convertStringToDate(String data, String formatFrom) {
    return new DateFormat(formatFrom).parse(data);
  }
}