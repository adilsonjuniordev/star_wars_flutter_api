import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/core/exceptions/repository_exception.dart';
import 'package:star_wars_w2o/app/models/character_model.dart';
import '../../core/ui/widgets/snackbars.dart';
import 'character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CustomDio dio;

  CharacterRepositoryImpl({required this.dio});

  @override
  Future<List<dynamic>> getCharacters() async {
    try {
      var result = await dio.get('/people', queryParameters: {'format': 'json'});
      return [
        result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList(),
        result.data['next'],
      ];
    } on DioError catch (e, s) {
      log('Erro ao buscar personagem', error: e, stackTrace: s);
      Snackbars.error('Oops..', 'Houve um erro ao buscar os personagens');
      throw RepositoryException(message: 'Houve um erro ao buscar os personagens');
    }
  }

  @override
  Future<List<dynamic>> getFilteredCharacters(String query) async {
    try {
      var result = await dio.get('/people', queryParameters: {
        'format': 'json',
        'search': query,
      });
      return [
        result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList(),
        result.data['next'],
      ];
    } on DioError catch (e, s) {
      log('Erro ao pesquisar personagem', error: e, stackTrace: s);
      Snackbars.error('Oops..', 'Houve um erro ao pesquisar os personagens');
      throw RepositoryException(message: 'Houve um erro ao pesquisar os personagens');
    }
  }
}
