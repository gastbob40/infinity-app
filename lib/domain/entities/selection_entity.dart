import 'package:infinity/domain/entities/teacher_entity.dart';

enum SelectionType { NONE, GROUP, TEACHER }

class SelectionEntity {
  SelectionType type;
  TeacherEntity? teacherEntity;

  SelectionEntity({required this.type, this.teacherEntity});

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
          'id': teacherEntity?.id,
          'name': teacherEntity?.name
        };
    }
  }

  factory SelectionEntity.fromJson(Map<String, dynamic> map) {
    if (map['type'] == 'none') return empty();

    if (map['type'] == 'teacher')
      return SelectionEntity(
          type: SelectionType.TEACHER,
          teacherEntity: TeacherEntity(name: map['name'], id: map['id']));

    return empty();
  }
}
