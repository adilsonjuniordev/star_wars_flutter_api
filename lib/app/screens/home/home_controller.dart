import 'dart:developer';
import 'package:get/get.dart';
import '../../core/api/custom_dio.dart';
import '../../models/character_model.dart';
import '../../core/ui/widgets/loader.dart';
import '../../core/ui/widgets/snackbars.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../repository/character_repository/character_repository.dart';

class HomeController extends GetxController {
  CharacterRepository characterRepository = Get.find();
  CustomDio customDio = Get.find(tag: 'dio');

  String? _next = Get.arguments['next'];
  final _characters = <CharacterModel>[...Get.arguments['characters']].obs;

  String? _nextFiltered = '';
  final _charactersFiltered = <CharacterModel>[].obs;
  var query = ''.obs;

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
        var result = await customDio.get(_next!);
        _characters.addAll(result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList());
        _next = result.data['next'];
        Get.back();
      } on Exception catch (e) {
        log('Erro ao buscar personagem', error: e);
        Get.back();
        Snackbars.error('Oops..', 'Houve um erro ao buscar os dados');
        throw RepositoryException(message: 'Houve um erro ao buscar os dados');
      }
    }
  }

  Future<void> nextPageFiltered() async {
    if (_nextFiltered != null) {
      try {
        Get.dialog(const Loader(), barrierDismissible: false);
        var result = await customDio.get(_nextFiltered!);
        _charactersFiltered.addAll(result.data['results'].map<CharacterModel>((c) => CharacterModel.fromMap(c)).toList());
        _nextFiltered = result.data['next'];
        Get.back();
      } on Exception catch (e) {
        log('Erro ao buscar mais personages pelo filtro', error: e);
        Get.back();
        Snackbars.error('Oops..', 'Houve um rro ao buscar mais personages pelo filtro');
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
