class TeacherEntity {
  final int id;
  final String name;

  TeacherEntity({
    required this.id,
    required this.name
  });

  @override
  String toString() {
    return this.name;
  }
}