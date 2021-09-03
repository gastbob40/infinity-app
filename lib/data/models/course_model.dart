class CourseModel {
  final int id;
  final int zid;
  final String name;
  final String code;
  final int duration;

  CourseModel(
      {required this.id,
      required this.zid,
      required this.name,
      required this.code,
      required this.duration});

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
        id: map['id'],
        zid: map['zid'],
        name: map['name'],
        code: map['code'],
        duration: map['duration']);
  }

  @override
  String toString() {
    return this.name;
  }
}
