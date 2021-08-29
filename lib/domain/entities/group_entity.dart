class GroupEntity {
  final int id;
  final String name;

  GroupEntity({required this.id, required this.name});

  bool match(String str) {
    return this.name.toLowerCase().contains(str.toLowerCase());
  }

  @override
  String toString() {
    return this.name;
  }
}
