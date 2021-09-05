import 'dart:io';

import 'package:dio/dio.dart';
import 'package:infinity/data/models/reservation_model.dart';
import 'package:infinity/domain/entities/day_reservations_entity.dart';
import 'package:infinity/domain/entities/selection_entity.dart';

class ReservationRepository {
  static const String zeusGroupUrl = 'https://zeus.infinity.study/api/groups/';

  Future<List<ReservationModel>> _getGroupReservations(
      SelectionEntity selectionEntity) async {
    try {
      final response = await Dio().get(zeusGroupUrl +
          (selectionEntity.groupEntity?.id ?? "").toString() +
          '/reservations');

      if (response.statusCode == 200) {
        final data = List<Map<String, dynamic>>.from(response.data);
        List<ReservationModel> reservations =
            data.map((e) => ReservationModel.fromMap(e)).toList();
        return reservations;
      }
      return [];
    } on DioError catch (err) {} on SocketException catch (err) {} on Exception catch (e) {}

    return [];
  }

  Future<List<DayReservationsEntity>> getReservation(
      SelectionEntity selectionEntity) async {
    List<ReservationModel> reservations =
        await this._getGroupReservations(selectionEntity);

    List<DayReservationsEntity> daysReservations = [];

    reservations.forEach((reservation) {
      List<DayReservationsEntity> possible = daysReservations
          .where((x) =>
              x.day == reservation.startDate.day &&
              x.month == reservation.startDate.month &&
              x.year == reservation.startDate.year)
          .toList();

      if (possible.isEmpty) {
        DayReservationsEntity current = DayReservationsEntity(
            year: reservation.startDate.year,
            month: reservation.startDate.month,
            day: reservation.startDate.day);
        current.reservations.add(reservation.toEntity());
        daysReservations.add(current);
      } else {
        possible.first.reservations.add(reservation.toEntity());
      }
    });

    return daysReservations;
  }
}
