class SomeModel {
  final String id;

  SomeModel(this.id);

  // factory from json
  SomeModel.fromJson(Map<String, dynamic> json) : id = json['id'];
}
