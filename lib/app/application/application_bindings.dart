import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/repository/character_repository/character_repository_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(() => CustomDio());
    Get.put(() => CharacterRepositoryImpl(dio: Get.find()));
  }
}
