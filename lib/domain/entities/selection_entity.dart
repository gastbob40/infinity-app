import 'package:infinity/domain/entities/teacher_entity.dart';

enum SelectionType { GROUP, TEACHER }

class Selection {
  SelectionType type;
  TeacherEntity? teacherEntity;

  Selection.name({required this.type, this.teacherEntity});
}
