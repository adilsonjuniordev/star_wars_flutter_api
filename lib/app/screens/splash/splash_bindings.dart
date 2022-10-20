import 'package:get/get.dart';
import 'splash_controller.dart';
import '../../core/api/custom_dio.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomDio());
    Get.put(SplashController());
  }
}
