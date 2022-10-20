import 'dart:convert';

class PlanetModel {
  final String name;
  final String diameter;
  final String terrain;

  PlanetModel({
    required this.name,
    required this.diameter,
    required this.terrain,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'diameter': diameter,
      'terrain': terrain,
    };
  }

  factory PlanetModel.fromMap(Map<String, dynamic> map) {
    return PlanetModel(
      name: (map['name'] ?? '') as String,
      diameter: (map['diameter'] ?? '') as String,
      terrain: (map['terrain'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanetModel.fromJson(String source) => PlanetModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
