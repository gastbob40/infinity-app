import 'package:infinity/domain/entities/group_entity.dart';
import 'package:infinity/domain/entities/teacher_entity.dart';

enum SelectionType { NONE, GROUP, TEACHER }

class SelectionEntity {
  SelectionType type;
  TeacherEntity? teacherEntity;
  GroupEntity? groupEntity;

  SelectionEntity({required this.type, this.teacherEntity, this.groupEntity});

  static SelectionEntity empty() {
    return SelectionEntity(type: SelectionType.NONE);
  }

  Map<String, dynamic> toJson() {
    switch (type) {
      case SelectionType.NONE:
        return {'type': 'none'};
      case SelectionType.TEACHER:
        return {
          'type': 'teacher',
          'id': teacherEntity?.id,
          'name': teacherEntity?.name
        };
      case SelectionType.GROUP:
        return {
          'type': 'group',
          'id': groupEntity?.id,
          'name': groupEntity?.name
        };
    }
  }

  factory SelectionEntity.fromJson(Map<String, dynamic> map) {
    if (map['type'] == 'none') return empty();

    if (map['type'] == 'teacher')
      return SelectionEntity(
          type: SelectionType.TEACHER,
          teacherEntity: TeacherEntity(name: map['name'], id: map['id']));

    if (map['type'] == 'group')
      return SelectionEntity(
          type: SelectionType.GROUP,
          groupEntity: GroupEntity(name: map['name'], id: map['id']));

    return empty();
  }

  @override
  String toString() {
    switch (type) {
      case SelectionType.NONE:
        return "{type: none}";
      case SelectionType.TEACHER:
        return "{type: teacher}";
      case SelectionType.GROUP:
        return "{type: group}";
    }
  }
}
