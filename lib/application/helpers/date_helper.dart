import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(String date) {
    DateTime dt = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("d MMM y").format(dt);
  }

  static String formatDateFullMonth(String date) {
    DateTime dt = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("d MMMM y", "id").format(dt);
  }

  static String formatDateTime(String? date) {
    if (date == null) return "-";
    DateTime dt = DateFormat("yyyy-MM-dd H:m:s").parse(date);
    return DateFormat("d MMM y H:m:s").format(dt);
  }

  static String differenceDate(String dateStart, String dateEnd) {
    DateTime dtStart = DateFormat("yyyy-MM-dd").parse(dateStart);
    DateTime dtEnd = DateFormat("yyyy-MM-dd").parse(dateEnd);

    return "${dtEnd.difference(dtStart).inDays + 1} Hari Kerja";
  }

  static Duration remainingDay(String dateStart) {
    DateTime dtStart =
        DateFormat("yyyy-MM-dd HH:mm:ss", "id_ID").tryParse(dateStart) ?? DateTime.now();
    DateTime dtEnd = DateTime.now();
    return dtStart.difference(dtEnd);
  }

  static String formatDateTimeTz(String? date) {
    if (date == null) return "-";
    DateTime dt = DateTime.parse(date);
    return DateFormat("d MMM y").format(dt);
  }

  static String formatOnlyDate(String? date) {
    if (date == null) return "-";
    DateTime dt = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    return DateFormat("yyyy-MM-dd").format(dt);
  }
}
