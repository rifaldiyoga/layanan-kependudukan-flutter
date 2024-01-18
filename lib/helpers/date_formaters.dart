import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormater {
  static const String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
  static const String DATE_FORMAT_MONTH = "dd MMM yyy";
  static const String DATE_DAY_FORMAT = "EEEE, dd MMM yyyy HH:mm";

  static DateTime stringToDateTime(String date, String formatDate) {
    DateFormat format = DateFormat(formatDate);
    return format.parse(date);
  }

  static String dateTimeToString(DateTime date, String formatDate) {
    Intl.defaultLocale = 'id';
    DateFormat format = DateFormat(formatDate, 'id');
    return format.format(date);
  }

  static String dateToTimeAgo(DateTime dateTime) {
    return timeago.format(dateTime);
  }
}
