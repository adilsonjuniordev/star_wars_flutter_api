import 'dart:convert';

class StarshipModel {
  final String name;

  StarshipModel({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory StarshipModel.fromMap(Map<String, dynamic> map) {
    return StarshipModel(
      name: (map['name'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StarshipModel.fromJson(String source) => StarshipModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
