import 'package:intl/intl.dart';

class DateFormateUtils {
  DateFormateUtils._();

  static String converterDateWithHours(String date) {
    final now = DateTime.now();

    final strToDateTime = DateTime.parse(date);
    final convertLocal = strToDateTime.toLocal();
    if (convertLocal.day == now.day &&
        convertLocal.month == now.month &&
        convertLocal.year == now.year) {
      final newFormat = DateFormat().add_Hm();
      final String updatedDt = newFormat.format(convertLocal);
      return 'Hoje $updatedDt';
    }
    final DateTime yesterday = now.subtract(const Duration(days: 1));
    if (convertLocal.day == yesterday.day &&
        convertLocal.month == yesterday.month &&
        convertLocal.year == yesterday.year) {
      final newFormat = DateFormat().add_Hm();
      final String updatedDt = newFormat.format(convertLocal);
      return 'Ontem $updatedDt';
    }
    if (now.difference(convertLocal).inDays < 6) {
      final String weekday = DateFormat('EEEE', 'pt_Br').format(convertLocal);
      return weekday;
    }
    return DateFormat('dd/MM/yyyy HH:mm', 'pt_Br').format(convertLocal);
  }
}
