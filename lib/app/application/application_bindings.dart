import 'package:get/get.dart';
import 'package:star_wars_w2o/app/core/api/custom_dio.dart';

import '../core/config/env/env.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomDio(Env.i['backend_base_url']), permanent: true);
    Get.put(CustomDio(), tag: 'dio', permanent: true);
  }
}
