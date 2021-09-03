class RoomModel {
  final int id;
  final int zid;
  final int capacity;
  final String name;

  RoomModel(
      {required this.id,
      required this.zid,
      required this.capacity,
      required this.name});

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
        id: map['id'],
        zid: map['zid'],
        capacity: map['capacity'],
        name: map['name']);
  }

  @override
  String toString() {
    return this.name;
  }
}
