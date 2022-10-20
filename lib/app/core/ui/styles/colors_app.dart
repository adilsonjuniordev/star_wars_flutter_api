import 'package:flutter/widgets.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFFFFBB25);
  Color get grey => const Color(0XFFCCCCCC);
  Color get greyDark => const Color(0XFF999999);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
