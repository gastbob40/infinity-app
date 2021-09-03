import 'dart:io';

import 'package:dio/dio.dart';
import 'package:infinity/data/models/reservation_model.dart';
import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:infinity/domain/entities/teacher_entity.dart';

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
        print(reservations);
        // return teachers;
        return [];
      }
      return [];
    } on DioError catch (err) {
      print(err);
    } on SocketException catch (err) {
      print(err);
    } on Exception catch (e) {
      print(e);
    }

    return [];
  }

  Future<List<TeacherEntity>> getReservation(
      SelectionEntity selectionEntity) async {
    List<ReservationModel> reservations =
        await this._getGroupReservations(selectionEntity);
    return [];
  }
}
