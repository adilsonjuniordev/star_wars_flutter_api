import 'package:get/get.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository_impl.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CharacterRepository>(CharacterRepositoryImpl(dio: Get.find()));
    Get.put(HomeController());
  }
}
