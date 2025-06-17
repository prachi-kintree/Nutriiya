import 'package:intl/intl.dart';

extension kintreeDateTime on DateTime {
  String getFormatStringFromDate({required String withPattern}) {
    return DateFormat(withPattern).format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String formatTime() {
    // Format the date to display only the hour and minute in 24-hour format
    return DateFormat.Hm().format(this);
  }
  String formatTimeHms() {
    // Format the date to display only the hour and minute in 24-hour format
    return DateFormat.Hms().format(this);
  }

  String getShortMonth() {
    return DateFormat.MMM().format(this);
  }
}
