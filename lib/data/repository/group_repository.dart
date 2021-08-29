import 'dart:io';

import 'package:dio/dio.dart';
import 'package:infinity/data/models/group_repository.dart';
import 'package:infinity/domain/entities/group_entity.dart';

class GroupRepository {
  static const String zeusUrl = 'https://zeus.infinity.study/api/groups/';

  Future<List<GroupModel>> _getFromApi() async {
    try {
      final response = await Dio().get(zeusUrl);

      if (response.statusCode == 200) {
        final data = List<Map<String, dynamic>>.from(response.data);
        List<GroupModel> groups =
            data.map((e) => GroupModel.fromMap(e)).toList();
        return groups;
      }
      return [];
    } on DioError catch (err) {
      print(err);
    } on SocketException catch (err) {
      print(err);
    }
    return [];
  }

  Future<List<GroupEntity>> getGroups() async {
    List<GroupModel> groupModels = await this._getFromApi();
    List<GroupEntity> groupEntities = [];

    groupModels.forEach((element) {
      groupEntities.addAll(element.toEntities());
    });

    return groupEntities;
  }
}
