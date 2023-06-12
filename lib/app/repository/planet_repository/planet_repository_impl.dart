import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/models/planet_model.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/ui/widgets/snackbars.dart';
import './planet_repository.dart';

class PlanetRepositoryImpl implements PlanetRepository {
  final CustomDio dio;

  PlanetRepositoryImpl({required this.dio});

  @override
  Future<List<PlanetModel>> getPlanet(String url) async {
    try {
      var result = await dio.get(url, queryParameters: {'format': 'json'});
      return [result.data].map<PlanetModel>((c) => PlanetModel.fromMap(c)).toList();
    } on DioException catch (e, s) {
      log('Erro ao pesquisar planeta', error: e, stackTrace: s);
      Snackbars.error('Oops..', 'Houve um erro ao pesquisar o planeta');
      throw RepositoryException(message: 'Houve um erro ao pesquisar o planeta');
    }
  }
}
