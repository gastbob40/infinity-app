class TeacherEntity {
  final int id;
  final String name;

  TeacherEntity({
    required this.id,
    required this.name
  });

  bool match(String str) {
    return this.name.toLowerCase().contains(str.toLowerCase());
  }

  @override
  String toString() {
    return this.name;
  }
}