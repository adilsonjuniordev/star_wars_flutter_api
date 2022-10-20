import 'package:get/get.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';
import 'package:star_wars_w2o/app/screens/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomDio());
    Get.put(SplashController());
  }
}
