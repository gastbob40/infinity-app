import 'dart:convert';

import 'package:infinity/domain/entities/selection_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionRepository {
  Future<SelectionEntity> getSelection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('selection');

    if (json == null) return SelectionEntity.empty();

    Map<String, dynamic> map = jsonDecode(json);
    return SelectionEntity.fromJson(map);
  }

  void setSelection(SelectionEntity selectionEntity) async {
    String json = jsonEncode(selectionEntity);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selection', json);
  }
}
