import 'package:get/get.dart';
import './character_details_controller.dart';

class CharacterDetailsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CharacterDetailsController());
    }
}