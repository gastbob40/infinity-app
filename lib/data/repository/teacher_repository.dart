import 'dart:io';

import 'package:dio/dio.dart';
import 'package:infinity/data/models/teacher_model.dart';
import 'package:infinity/domain/entities/teacher_entity.dart';

class TeacherRepository {
  static const String zeusUrl = 'https://zeus.infinity.study/api/teachers/';

  Future<List<TeacherModel>> _getFromApi() async {
    try {
      final response = await Dio().get(zeusUrl);

      if (response.statusCode == 200) {
        final data = List<Map<String, dynamic>>.from(response.data);
        List<TeacherModel> teachers = data.map((e) => TeacherModel.fromMap(e)).toList();
        return teachers;
      }
      return [];
    } on DioError catch (err) {
    } on SocketException catch (err) {
    }
    return [];
  }

  Future<List<TeacherEntity>> getTeachers() async {
    List<TeacherModel> teachers = await this._getFromApi();
    return teachers.map((e) => e.toEntity()).toList();
  }
}