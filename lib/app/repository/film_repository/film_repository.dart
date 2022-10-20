import 'package:star_wars_w2o/app/models/film_model.dart';

abstract class FilmRepository {
  Future<List<FilmModel>> getFilms(List<dynamic> films);
}
