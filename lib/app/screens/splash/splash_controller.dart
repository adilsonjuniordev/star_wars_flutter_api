import 'package:get/get.dart';
import '../../models/character_model.dart';
import '../../repository/character_repository/character_repository_impl.dart';

class SplashController extends GetxController {
  RxList<CharacterModel> characters = <CharacterModel>[].obs;
  String next = '';

  @override
  void onInit() async {
    final characterRepository = CharacterRepositoryImpl(dio: Get.find());
    List result = await characterRepository.getCharacters();
    characters.addAll(result[0]);
    next = result[1];
    Get.offAndToNamed('/home', arguments: {
      'characters': characters,
      'next': next,
    });

    super.onInit();
  }
}
