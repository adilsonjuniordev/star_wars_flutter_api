import 'dart:convert';

class FilmModel {
  final String title;
  final String director;
  final String releaseDate;
  final String producer;

  FilmModel({
    required this.title,
    required this.director,
    required this.releaseDate,
    required this.producer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'director': director,
      'release_date': releaseDate,
      'producer': producer,
    };
  }

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel(
      title: (map['title'] ?? '') as String,
      director: (map['director'] ?? '') as String,
      releaseDate: (map['release_date'] ?? '') as String,
      producer: (map['producer'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmModel.fromJson(String source) => FilmModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
