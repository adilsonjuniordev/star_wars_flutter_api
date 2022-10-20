import 'package:get/get.dart';
import 'package:star_wars_w2o/app/models/character_model.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository_impl.dart';

class SplashController extends GetxController {
  RxList<CharacterModel> characters = <CharacterModel>[].obs;
  String next = '';

  @override
  void onInit() async {
    final characterRepository = CharacterRepositoryImpl(dio: Get.find());
    List result = await characterRepository.getCharacters();
    characters.addAll(result[0]);
    next = result[1];
    //characters.addAll(await characterRepository.getCharacters());
    Get.offAndToNamed('/home', arguments: {
      'characters': characters,
      'next': next,
    });

    super.onInit();
  }
}
