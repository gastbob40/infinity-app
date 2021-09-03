import 'package:infinity/data/models/course_model.dart';
import 'package:infinity/data/models/group_model.dart';
import 'package:infinity/data/models/room_model.dart';
import 'package:infinity/data/models/teacher_model.dart';

class ReservationModel {
  final int id;
  final int zid;
  final String type;
  final String name;
  final bool online;
  final DateTime startDate;
  final DateTime endDate;
  final CourseModel? course;
  final List<GroupModel> groups;
  final List<TeacherModel> teachers;
  final List<RoomModel> rooms;

  ReservationModel({
    required this.id,
    required this.zid,
    required this.type,
    required this.name,
    required this.online,
    required this.startDate,
    required this.endDate,
    required this.course,
    required this.groups,
    required this.teachers,
    required this.rooms,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    List<GroupModel> groups = map['groups']
        .map<GroupModel>((group) => GroupModel.fromMap(group))
        .toList();
    List<TeacherModel> teachers = map['teachers']
        .map<TeacherModel>((teacher) => TeacherModel.fromMap(teacher))
        .toList();
    List<RoomModel> rooms =
        map['rooms'].map<RoomModel>((room) => RoomModel.fromMap(room)).toList();

    return ReservationModel(
        id: map['id'],
        zid: map['id'],
        type: map['type']['type'],
        name: map['name'],
        online: map['online'],
        startDate: DateTime.parse(map['startDate']),
        endDate: DateTime.parse(map['endDate']),
        course:
            map['course'] == null ? null : CourseModel.fromMap(map['course']),
        groups: groups,
        teachers: teachers,
        rooms: rooms);
  }

  @override
  String toString() {
    return this.name + '[' + this.type + '][' + this.id.toString() + ']';
  }
}
