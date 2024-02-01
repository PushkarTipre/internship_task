import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class DateControl {
  final DateTime date;

  DateControl({required this.date});
  String get formattedDate {
    return formatter.format(date);
  }
}
