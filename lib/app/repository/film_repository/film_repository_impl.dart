import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/models/film_model.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/ui/widgets/snackbars.dart';
import './film_repository.dart';

class FilmRepositoryImpl implements FilmRepository {
  final CustomDio dio;

  FilmRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<FilmModel>> getFilms(List<dynamic> strings) async {
    List<FilmModel> films = [];
    try {
      for (var s in strings) {
        var result = await dio.get(s, queryParameters: {'format': 'json'});
        films.add(FilmModel.fromMap(result.data));
      }
      return films;
    } on DioException catch (e, s) {
      log('Erro ao pesquisar planeta', error: e, stackTrace: s);
      Snackbars.error('Oops..', 'Houve um erro ao pesquisar o planeta');
      throw RepositoryException(message: 'Houve um erro ao pesquisar o planeta');
    }
  }
}
