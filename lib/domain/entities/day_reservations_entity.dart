import 'package:infinity/domain/entities/reservation_entity.dart';

class DayReservationsEntity {
  final int year;
  final int month;
  final int day;
  List<ReservationEntity> reservations = [];

  DayReservationsEntity(
      {required this.year, required this.month, required this.day});
}
