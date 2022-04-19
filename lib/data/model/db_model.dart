class DBModel {
  int id;
  String name;

  DBModel(
    this.id, {
    required this.name,
  });

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  @override
  String toString() => 'DBModel {id: $id, name: $name}';
}
