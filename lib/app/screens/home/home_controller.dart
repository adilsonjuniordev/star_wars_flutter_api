import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/core/ui/widgets/loader.dart';
import 'package:star_wars_w2o/app/core/ui/widgets/snackbars.dart';
import 'package:star_wars_w2o/app/models/character_model.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository_impl.dart';

import '../../core/exceptions/repository_exception.dart';

class HomeController extends GetxController {
  final dio = Dio();
  CharacterRepository characterRepository = CharacterRepositoryImpl(dio: Get.find());
  CustomDio customDio = Get.find();

  final RxList<CharacterModel> _characters = <CharacterModel>[...Get.arguments['characters']].obs;
  final RxList<CharacterModel> _charactersFiltered = <CharacterModel>[].obs;
  final RxString query = ''.obs;

  String? _next = Get.arguments['next'];
  String? _nextFiltered = '';

  List<CharacterModel> get characters => _characters.toList();
  List<CharacterModel> get charactersFiltered => _charactersFiltered.toList();

  @override
  void onInit() {
    debounce(query, (_) => search(query.value), time: const Duration(milliseconds: 500));
    super.onInit();
  }

  Future<void> nextPage() async {
    if (_next != null) {
      try {
        Get.dialog(const Loader(), barrierDismissible: false);
        var result = await dio.get(_next!);
        _characters.addAll(result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList());
        _next = result.data['next'];
        Get.back();
      } on Exception catch (e) {
        log('Erro ao buscar personagem', error: e);
        Get.back();
        Snackbars().snackbarError('Oops..', 'Houve um erro ao buscar os dados');
        throw RepositoryException(message: 'Houve um erro ao buscar os dados');
      }
    }
  }

  Future<void> nextPageFiltered() async {
    if (_nextFiltered != null) {
      try {
        Get.dialog(const Loader(), barrierDismissible: false);
        var result = await dio.get(_nextFiltered!);
        _charactersFiltered.addAll(result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList());
        _nextFiltered = result.data['next'];
        Get.back();
      } on Exception catch (e) {
        log('Erro ao buscar mais personages pelo filtro', error: e);
        Get.back();
        Snackbars().snackbarError('Oops..', 'Houve um rro ao buscar mais personages pelo filtro');
        throw RepositoryException(message: 'Houve um erro ao buscar mais personages pelo filtro');
      }
    }
  }

  Future search(String query) async {
    if (query.isNotEmpty) {
      Get.dialog(const Loader(), barrierDismissible: false);
      var result = await characterRepository.getFilteredCharacters(query);

      _charactersFiltered.assignAll(result[0]);
      _nextFiltered = result[1];

      Get.back();
    }
  }
}
