import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:star_wars_w2o/app/models/starship_model.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/ui/widgets/snackbars.dart';
import './starship_repository.dart';

class StarshipRepositoryImpl implements StarshipRepository {
  final Dio dio;

  StarshipRepositoryImpl({required this.dio});

  @override
  Future<List<StarshipModel>> getStarship(String url) async {
    try {
      var result = await dio.get(url, queryParameters: {'format': 'json'});
      return [result.data].map<StarshipModel>((c) => StarshipModel.fromMap(c)).toList();
    } on DioError catch (e, s) {
      log('Erro ao pesquisar nave', error: e, stackTrace: s);
      Snackbars.error('Oops..', 'Houve um erro ao pesquisar a nave');
      throw RepositoryException(message: 'Houve um erro ao pesquisar a nave');
    }
  }
}
