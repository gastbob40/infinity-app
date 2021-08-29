import 'package:infinity/domain/entities/group_entity.dart';

class GroupModel {
  final int id;
  final String name;
  final int zid;
  List<GroupModel> children;

  GroupModel(
      {required this.id,
      required this.name,
      required this.zid,
      required this.children});

  List<GroupEntity> toEntities() {
    List<GroupEntity> entities = [GroupEntity(id: this.id, name: this.name)];

    this.children.forEach((x) => entities.addAll(x.toEntities()));
    return entities;
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    List<GroupModel> realChildren = [];

    map['children']
        .map((x) => GroupModel.fromMap(x))
        .toList()
        .forEach((x) => realChildren.add(x));

    return GroupModel(
        id: map['id'],
        name: map['name'],
        zid: map['zid'],
        children: realChildren);
  }

  @override
  String toString() {
    return this.name;
  }
}
