import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars_w2o/app/application/application_bindings.dart';
import 'package:star_wars_w2o/app/core/ui/theme/theme_config.dart';
import 'package:star_wars_w2o/app/screens/character_details/character_details_bindings.dart';
import 'package:star_wars_w2o/app/screens/character_details/character_details_page.dart';
import 'package:star_wars_w2o/app/screens/home/home_bindings.dart';
import 'package:star_wars_w2o/app/screens/home/home_page.dart';
import 'package:star_wars_w2o/app/screens/splash/splash_bindings.dart';
import 'package:star_wars_w2o/app/screens/splash/splash_page.dart';
import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Star Wars',
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      getPages: [
        GetPage(name: '/', page: () => const SplashPage(), binding: SplashBindings(), children: [
          GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings()),
          GetPage(name: '/character_details', page: () => const CharacterDetailsPage(), binding: CharacterDetailsBindings()),
        ]),
      ],
    );
  }
}
