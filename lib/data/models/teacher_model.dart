import 'package:infinity/domain/entities/teacher_entity.dart';

class TeacherModel {
  final int id;
  final String name;
  final String firstname;
  final bool internal;
  final int zid;

  TeacherModel({
    required this.id,
    required this.name,
    required this.firstname,
    required this.internal,
    required this.zid
  });

  TeacherEntity toEntity() {
    return TeacherEntity(id: this.id, name: this.firstname + ' ' + this.name);
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
        id: map['id'],
        name: map['name'],
        firstname: map['firstname'],
        internal: map['internal'],
        zid: map['zid']
    );
  }

  @override
  String toString() {
    return this.firstname + ' ' + this.name;
  }
}