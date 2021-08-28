import 'package:infinity/domain/entities/teacher_entity.dart';

enum SelectionType { NONE, GROUP, TEACHER }

class Selection {
  SelectionType type;
  TeacherEntity? teacherEntity;

  Selection({required this.type, this.teacherEntity});

  static Selection empty() {
    return Selection(type: SelectionType.NONE);
  }
}
