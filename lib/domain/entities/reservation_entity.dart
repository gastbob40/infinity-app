import 'package:intl/intl.dart';

class ReservationEntity {
  String teachers;
  String rooms;
  String groups;
  DateTime startDate;
  DateTime endDate;
  String type;
  String name;
  int? courseId;

  ReservationEntity(
      {required this.teachers,
      required this.rooms,
      required this.groups,
      required this.startDate,
      required this.endDate,
      required this.type,
      required this.name,
      required this.courseId});

  String getFormattedStart() {
    final DateFormat formatter = DateFormat('Hm');
    return formatter.format(this.startDate).replaceAll(':', 'h');
  }

  String getFormattedEnd() {
    final DateFormat formatter = DateFormat('Hm');
    return formatter.format(this.endDate).replaceAll(':', 'h');
  }
}
