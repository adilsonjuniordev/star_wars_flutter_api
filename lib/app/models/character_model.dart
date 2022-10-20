// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CharacterModel {
  final String name;
  final String gender;
  final String birthYear;
  final String homeworld;
  final List starships;
  final List films;

  CharacterModel({
    required this.name,
    required this.gender,
    required this.birthYear,
    required this.homeworld,
    required this.starships,
    required this.films,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'birth_year': birthYear,
      'homeworld': homeworld,
      'starships': starships,
      'films': films,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: (map['name'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      birthYear: (map['birth_year'] ?? '') as String,
      homeworld: (map['homeworld'] ?? '') as String,
      starships: List.from((map['starships'] ?? const <dynamic>[]) as List),
      films: List.from((map['films'] ?? const <dynamic>[]) as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) => CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
