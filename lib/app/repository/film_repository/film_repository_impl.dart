// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:star_wars_w2o/app/models/film_model.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/ui/widgets/snackbars.dart';
import './film_repository.dart';

class FilmRepositoryImpl implements FilmRepository {
  final Dio dio;

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
    } on DioError catch (e, s) {
      log('Erro ao pesquisar planeta', error: e, stackTrace: s);
      Snackbars().snackbarError('Oops..', 'Houve um erro ao pesquisar o planeta');
      throw RepositoryException(message: 'Houve um erro ao pesquisar o planeta');
    }
  }
}
